# Fan PWM Mapping (nct6799)
#
# pwm1 — Case fan (CHA_FAN1)
# pwm2 — CPU fan (CPU_FAN) + CPU_OPT (CPU_OPT follows CPU_FAN via BIOS)
# pwm3 — Case fan (CHA_FAN2)
# pwm4 — Case fan (CHA_FAN3)

{ pkgs, ... }:
{
  # Fan control — silent curve via nct6799 Super I/O auto-points
  # BIOS fan control is disabled (set to full speed / ignore in UEFI setup).
  # A timer reapplies the curve every 10 s to guard against resets.
  boot.kernelModules = [ "nct6775" ];
  environment.systemPackages = [ pkgs.lm_sensors ];

  systemd.timers.fan-curve = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "0";
      OnUnitActiveSec = "10s";
    };
  };

  systemd.services.fan-curve = {
    description = "Set silent fan curve on nct6799";
    after = [ "systemd-modules-load.service" ];
    serviceConfig.Type = "oneshot";
    script = ''
      set +e # nct6799 writes can transiently fail; don't abort on errors

      # Find the nct6799 hwmon device (hwmon number can change between boots)
      NCT=""
      for hwmon in /sys/class/hwmon/hwmon*; do
        if [ "$(cat "$hwmon/name" 2>/dev/null)" = "nct6799" ]; then
          NCT="$hwmon"
          break
        fi
      done
      if [ -z "$NCT" ]; then
        echo "nct6799 not found"
        exit 1
      fi

      # Enable Smart Fan IV (auto-point) mode for all controlled fans
      echo 5 > "$NCT/pwm1_enable"
      echo 5 > "$NCT/pwm2_enable"
      echo 5 > "$NCT/pwm3_enable"
      echo 5 > "$NCT/pwm4_enable"

      # CPU fan (PWM2) — responds to CPU temp (temp_sel=8, PECI/TSI Agent 0)
      # CPU_OPT (fan5) follows CPU_FAN automatically via ASUS BIOS
      # Temps are in millidegrees, PWM 0-255
      echo 8 > "$NCT/pwm2_temp_sel"
      echo 50000 > "$NCT/pwm2_auto_point1_temp"
      echo 30    > "$NCT/pwm2_auto_point1_pwm"
      echo 60000 > "$NCT/pwm2_auto_point2_temp"
      echo 64    > "$NCT/pwm2_auto_point2_pwm"
      echo 75000 > "$NCT/pwm2_auto_point3_temp"
      echo 115   > "$NCT/pwm2_auto_point3_pwm"
      echo 85000 > "$NCT/pwm2_auto_point4_temp"
      echo 178   > "$NCT/pwm2_auto_point4_pwm"
      echo 95000 > "$NCT/pwm2_auto_point5_temp"
      echo 255   > "$NCT/pwm2_auto_point5_pwm"

      # Case fans: CHA_FAN1/2/3 (PWM1, PWM3, PWM4) — respond to system temp (temp_sel=1, SYSTIN)
      for pwm in 1 3 4; do
        echo 1     > "$NCT/pwm''${pwm}_temp_sel"
        echo 30000 > "$NCT/pwm''${pwm}_auto_point1_temp"
        echo 30    > "$NCT/pwm''${pwm}_auto_point1_pwm"
        echo 35000 > "$NCT/pwm''${pwm}_auto_point2_temp"
        echo 80    > "$NCT/pwm''${pwm}_auto_point2_pwm"
        echo 40000 > "$NCT/pwm''${pwm}_auto_point3_temp"
        echo 140   > "$NCT/pwm''${pwm}_auto_point3_pwm"
        echo 50000 > "$NCT/pwm''${pwm}_auto_point4_temp"
        echo 200   > "$NCT/pwm''${pwm}_auto_point4_pwm"
        echo 60000 > "$NCT/pwm''${pwm}_auto_point5_temp"
        echo 255   > "$NCT/pwm''${pwm}_auto_point5_pwm"
      done
    '';
  };
}
