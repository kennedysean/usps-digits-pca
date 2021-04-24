% Simple 2D plotting example for reference
X = [0, -1, -3, 1, 3];
Y = [0, 2, 6, -2, -6];
plot(X,Y,marker='o',LineStyle='none');
axis(gca,[-5,5,-8,8])

K = [X; Y].'
C = cov(K);
[V,D] = eig(C)