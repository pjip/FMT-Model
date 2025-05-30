model_version = 'v1.0.0';
model_name = 'Boat Controller';

%% load configuration
load('control_default_config.mat');

%% Constant Variable
CONTROL_CONST.dt = 0.01;   % model execution period

%% Exported Value
CONTROL_EXPORT_VALUE.period = uint32(CONTROL_CONST.dt*1e3);
CONTROL_EXPORT_VALUE.model_info = int8([model_name, ' ', model_version, 0]); % 0 for end of string
% Export to firmware
CONTROL_EXPORT = Simulink.Parameter(CONTROL_EXPORT_VALUE);
CONTROL_EXPORT.CoderInfo.StorageClass = 'ExportedGlobal';

% Airframe id
AIRFRAME = 1;

%% Paramaters
CONTROL_PARAM_VALUE.VEL_P = single(0.5);
CONTROL_PARAM_VALUE.VEL_I = single(0.1);
CONTROL_PARAM_VALUE.VEL_D = single(0);
CONTROL_PARAM_VALUE.VEL_I_MAX = single(0.6);
CONTROL_PARAM_VALUE.VEL_I_MIN = single(-0.6);
CONTROL_PARAM_VALUE.VEL_D_MAX = single(0.1);
CONTROL_PARAM_VALUE.VEL_D_MIN = single(-0.1);
CONTROL_PARAM_VALUE.FW_PSI_RATE_P = single(0.0);
CONTROL_PARAM_VALUE.FW_PSI_RATE_I = single(0.2);
CONTROL_PARAM_VALUE.FW_PSI_RATE_D = single(0.0);
CONTROL_PARAM_VALUE.FW_PSI_RATE_FF = single(2.0);
CONTROL_PARAM_VALUE.BW_PSI_RATE_P = single(2.0);
CONTROL_PARAM_VALUE.BW_PSI_RATE_I = single(0.2);
CONTROL_PARAM_VALUE.BW_PSI_RATE_D = single(0.05);
CONTROL_PARAM_VALUE.BW_PSI_RATE_FF = single(0.0);
CONTROL_PARAM_VALUE.THROTTLE_MAX = single(1.0);
CONTROL_PARAM_VALUE.THROTTLE_MIN = single(-1.0);
CONTROL_PARAM_VALUE.THROTTLE_SCALE = single(500);
CONTROL_PARAM_VALUE.THROTTLE_BIAS = uint16(1500);
CONTROL_PARAM_VALUE.THROTTLE2_SCALE = single(500);
CONTROL_PARAM_VALUE.THROTTLE2_BIAS = uint16(1500);
CONTROL_PARAM_VALUE.SERVO_SCALE = single(250);
CONTROL_PARAM_VALUE.SERVO_BIAS = uint16(1500);
CONTROL_PARAM_VALUE.SERVO_MAX = single(1.0);
CONTROL_PARAM_VALUE.SERVO_MIN = single(-1.0);

% Export to firmware
CONTROL_PARAM = Simulink.Parameter(CONTROL_PARAM_VALUE);
CONTROL_PARAM.CoderInfo.StorageClass = 'ExportedGlobal';