% Batch Distillation Calculation
clc; clear;

% ===== Input Data =====
F     = 100;      % Feed (mol)
xF    = 0.5;      % Feed composition
alpha = 2.0;      % Relative volatility
xW    = 0.2;      % Final residue composition

% ===== Equilibrium relation =====
equilibriumY = @(x) (alpha*x)./(1+(alpha-1)*x);

% ===== Numerical Integration =====
steps = 1000;
dx = (xF - xW)/steps;
integralVal = 0;

for i = 1:steps
    x = xW + i*dx;
    y = equilibriumY(x);
    integralVal = integralVal + dx/(y-x);
end

ln_FW = integralVal;
W = F/exp(ln_FW);   % Final residue
D = F - W;          % Distillate
Recovery = (D/F)*100;

% ===== Results =====
fprintf('Batch Distillation Results:\n');
fprintf('Final Residue (W): %.2f mol\n',W);
fprintf('Distillate (D): %.2f mol\n',D);
fprintf('Recovery: %.2f %%\n',Recovery);
