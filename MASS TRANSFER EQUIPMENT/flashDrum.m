% Flash Drum Calculation
clc; clear;

% ===== Input Data =====
T     = 100;                % Temperature (°C)
P     = 1;                  % Pressure (bar)
F     = 100;                % Feed (kmol/hr)
z     = [0.4 0.6];          % Feed composition (mole fraction)
K     = [2.0 0.5];          % Equilibrium constants
MW    = [46.07 92.14];      % Molecular weights (kg/kmol)
kSB   = 0.20;               % Souders-Brown constant (m/s)
rhoL  = 800;                % Liquid density (kg/m³)
tres  = 5;                  % Liquid residence time (min)
hL    = 1.0;                % Liquid pool height (m)

% ===== Rachford-Rice to solve for vapor fraction =====
f = @(V) sum(z.*(K-1)./(1+V.*(K-1))); 

V = fzero(f,[0,1]);  % Vapor fraction
L = 1 - V;           % Liquid fraction

x = z ./ (1+V.*(K-1)); 
y = K.*x; 

x = x/sum(x);
y = y/sum(y);

% ===== Mass Flow Rates =====
F_mass = sum(z.*MW)*F;        % Feed mass flow (kg/hr)
L_mass = sum(x.*MW)*L*F;      % Liquid mass flow (kg/hr)
V_mass = sum(y.*MW)*V*F;      % Vapor mass flow (kg/hr)

% ===== Souders–Brown Diameter =====
rhoV = 1.2; % assume vapor density (kg/m³)
Vs = kSB * sqrt((rhoL-rhoV)/rhoV);      % allowable superficial velocity
A  = V_mass/3600 / (rhoV*Vs);           % area (m²)
D  = sqrt(4*A/pi);                      % vessel diameter (m)

% ===== Liquid Holdup & Height =====
Q_L = L_mass/3600 / rhoL;               % volumetric flow rate (m³/s)
VolL = Q_L * (tres*60);                 % holdup volume (m³)
AreaL = VolL/hL;                        % cross-sectional area (m²)
DL = sqrt(4*AreaL/pi);                  % diameter from liquid holdup (m)

% ===== Final Diameter =====
D_final = max(D,DL);

% ===== Results =====
fprintf('Flash Drum Results:\n');
fprintf('Vapor fraction (V): %.3f\n',V);
fprintf('Liquid fraction (L): %.3f\n',L);
fprintf('x (liquid comp): %s\n', mat2str(x,3));
fprintf('y (vapor comp): %s\n', mat2str(y,3));
fprintf('Liquid mass flow: %.2f kg/hr\n',L_mass);
fprintf('Vapor mass flow: %.2f kg/hr\n',V_mass);
fprintf('Drum diameter (from SB): %.3f m\n',D);
fprintf('Drum diameter (from holdup): %.3f m\n',DL);
fprintf('Final required diameter: %.3f m\n',D_final);
