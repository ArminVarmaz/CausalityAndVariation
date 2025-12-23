% Kausalitaet ≠ Variation – Demo 2
rng(7);

n = 6000; 
G = 60;

g = randi(G, n, 1);

% Große Between-Variation (Gruppenkomponente)
a = 10 * randn(G,1);

% x1 ist fast nur Between, kaum Within
x1 = a(g) + 0.05*randn(n,1);

% Weitere Treiber (dominieren Varianz)
x2 = randn(n,1);
x3 = randn(n,1);
eps = 2*randn(n,1);

% Wahrer DGP: kausaler Effekt von x1 ist 2
y = a(g) + 2*x1 + 4*x2 + 6*x3 + eps;

% ---------- Within-Transformation (demeaning) ----------
mu_y  = grpstats(y,  g, 'mean');  y_w  = y  - mu_y(g);
mu_x1 = grpstats(x1, g, 'mean');  x1_w = x1 - mu_x1(g);

% Optional: Controls ebenfalls demeanen (wenn du willst)
mu_x2 = grpstats(x2, g, 'mean');  x2_w = x2 - mu_x2(g);
mu_x3 = grpstats(x3, g, 'mean');  x3_w = x3 - mu_x3(g);

% ---------- Within-Schätzung ----------
% (A) nur x1
mdl_w1 = fitlm(x1_w, y_w);

% (B) x1 + Controls (zeigt oft: x1 bleibt kausal, erklärt aber wenig)
mdl_w2 = fitlm([x1_w x2_w x3_w], y_w);

fprintf('WITHIN (nur x1):   beta(x1)=%.3f, Within-R^2=%.6f\n', ...
        mdl_w1.Coefficients.Estimate(2), mdl_w1.Rsquared.Ordinary);

fprintf('WITHIN (x1+x2+x3): beta(x1)=%.3f, Within-R^2=%.6f\n', ...
        mdl_w2.Coefficients.Estimate(2), mdl_w2.Rsquared.Ordinary);

% Diagnose: Verhältnis der Within-Varianz
fprintf('Var(x1 within)/Var(x1 total) = %.6f\n', var(x1_w)/var(x1));
fprintf('Var(y within)/Var(y total)   = %.6f\n', var(y_w)/var(y));

figure; scatter(x1, y, 6, 'filled'); grid on;
xlabel('x1 (total)'); ylabel('y (total)');
title('Total Variation: x1 scheint viel zu erklären');

figure; scatter(x1_w, y_w, 6, 'filled'); grid on;
xlabel('x1 (within)'); ylabel('y (within)');
title('Within Variation (demeaned): fast kein Zusammenhang sichtbar');
