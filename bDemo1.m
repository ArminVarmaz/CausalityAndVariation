% Kausalitaet ≠ Variation Demo 1

rng(42);                   % Reproduzierbarkeit
n = 1000;                  % Beobachtungen

% "Wahre" Welt: y hängt von drei Faktoren ab
x1 = randn(n,1);           % kausaler Faktor
x2 = randn(n,1);           % andere unbeobachtete Faktoren
x3 = randn(n,1);
y  = 2*x1 + 3*x2 + 5*x3 + randn(n,1);

% Ökonometriker:innen fokussieren nur auf x1
mdl = fitlm(x1, y);

disp(mdl);

fprintf('\nR^2 (nur x1): %.4f\n', mdl.Rsquared.Ordinary);

% Kausalität ja, Variation nein
% Zur Verdeutlichung:
mdl_full = fitlm([x1 x2 x3], y);
fprintf('R^2 (alle Faktoren): %.4f\n', mdl_full.Rsquared.Ordinary);
