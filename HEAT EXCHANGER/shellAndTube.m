%% HEAT EXCHANGER CALCULATIONS
% Configurations: 1-1, 1-2, 2-4
clear; clc;

%% Input Data
% Fluid properties (example values, replace with actual)
mh = 1.5;        % Hot fluid mass flow rate (kg/s)
mc = 2.0;        % Cold fluid mass flow rate (kg/s)
Cph = 4180;      % Hot fluid Cp (J/kgK)
Cpc = 4180;      % Cold fluid Cp (J/kgK)
Thi = 80;        % Hot fluid inlet temp (°C)
Tho = 40;        % Hot fluid outlet temp (°C)
Tci = 30;        % Cold fluid inlet temp (°C)
Tco = 60;        % Cold fluid outlet temp (°C)
U   = 500;       % Overall heat transfer coeff (W/m²K)

% Tube geometry
D = 0.025;       % Tube diameter (m)
L = 2.0;         % Tube length (m)

% Fluid properties for Reynolds number
rho_h = 1000;    % Hot fluid density (kg/m³)
rho_c = 998;     % Cold fluid density (kg/m³)
mu_h = 0.001;    % Hot fluid viscosity (Pa·s)
mu_c = 0.001;    % Cold fluid viscosity (Pa·s)

%% Heat Duty
Qh = mh*Cph*(Thi - Tho);
Qc = mc*Cpc*(Tco - Tci);
Q = min(Qh, Qc); % kW consistency check
disp(['Heat Duty Q = ', num2str(Q/1000), ' kW']);

%% LMTD function
LMTD = @(dT1, dT2) ( (dT1 - dT2) / log(dT1/dT2) );

%% --- CASE 1: 1-1 Heat Exchanger ---
disp('--- 1-1 Heat Exchanger ---');
dT1 = Thi - Tco;
dT2 = Tho - Tci;
DTlm = LMTD(dT1, dT2);

A1 = Q / (U * DTlm);
Ntube1 = ceil(A1 / (pi*D*L));

% Reynolds numbers
Vh = mh / (rho_h * (pi*(D^2)/4) * Ntube1); % velocity hot
Re_h = (rho_h * Vh * D) / mu_h;
Vc = mc / (rho_c * (pi*(D^2)/4) * Ntube1); % velocity cold
Re_c = (rho_c * Vc * D) / mu_c;

disp(['Area required = ', num2str(A1), ' m²']);
disp(['Number of tubes = ', num2str(Ntube1)]);
disp(['Re_h = ', num2str(Re_h), ', Re_c = ', num2str(Re_c)]);

%% --- CASE 2: 1-2 Heat Exchanger ---
disp('--- 1-2 Heat Exchanger ---');
F = 0.95; % correction factor (example)
DTlm2 = DTlm * F;
A2 = Q / (U * DTlm2);
Ntube2 = ceil(A2 / (pi*D*L));

Vh = mh / (rho_h * (pi*(D^2)/4) * Ntube2);
Re_h2 = (rho_h * Vh * D) / mu_h;
Vc = mc / (rho_c * (pi*(D^2)/4) * Ntube2);
Re_c2 = (rho_c * Vc * D) / mu_c;

disp(['Area required = ', num2str(A2), ' m²']);
disp(['Number of tubes = ', num2str(Ntube2)]);
disp(['Re_h = ', num2str(Re_h2), ', Re_c = ', num2str(Re_c2)]);

%% --- CASE 3: 2-4 Heat Exchanger ---
disp('--- 2-4 Heat Exchanger ---');
F = 0.85; % correction factor (example lower due to complex flow)
DTlm3 = DTlm * F;
A3 = Q / (U * DTlm3);
Ntube3 = ceil(A3 / (pi*D*L));

Vh = mh / (rho_h * (pi*(D^2)/4) * Ntube3);
Re_h3 = (rho_h * Vh * D) / mu_h;
Vc = mc / (rho_c * (pi*(D^2)/4) * Ntube3);
Re_c3 = (rho_c * Vc * D) / mu_c;

disp(['Area required = ', num2str(A3), ' m²']);
disp(['Number of tubes = ', num2str(Ntube3)]);
disp(['Re_h = ', num2str(Re_h3), ', Re_c = ', num2str(Re_c3)]);

