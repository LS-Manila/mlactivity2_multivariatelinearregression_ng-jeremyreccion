x = load('ex2x.dat');
y = load('ex2y.dat');
plot(x(:,1),y,'o');
print('plot1','-dpng');
plot(x(:,2),y,'o');
print('plot2','-dpng');
x = [ones(47,1),x];

%preprocessing

sigma = std(x);
mu = mean(x);
x(:,2) = (x(:,2) - mu(2))./ sigma(2);
x(:,3) = (x(:,3) - mu(3))./ sigma(3);
plot(x(:,2),y,'o');
print('plot3','-dpng');
plot(x(:,3),y,'o');
print('plot4','-dpng');

%cost J

alpha = 0.8;
j = zeros(50,1);
theta = zeros(size(x(1,:)))';
for num = 1:50
j(num) = (0.5 * 47) * (x * theta - y)' * (x * theta - y);
theta = theta - (alpha / 47) * x' *(x * theta - y);
end
figure;
plot(0:49,j(1:50),'-');
xlabel('Number of iterations');
ylabel('Cost j');

%too small alpha

alpha = 0.01;
theta = zeros(size(x(1,:)))';
for num = 1:50
j(num) = (0.5 * 47) * (x * theta - y)' * (x * theta - y);
theta = theta - (alpha / 47) * x' *(x * theta - y);
end
plot(0:49,j(1:50),'-');

%too big alpha

alpha = 1.5;
theta = zeros(size(x(1,:)))';
for num = 1:50
j(num) = (0.5 * 47) * (x * theta - y)' * (x * theta - y);
theta = theta - (alpha / 47) * x' *(x * theta - y);
end
plot(0:49,j(1:50),'-');

%house price

s_area = (1650 - mu(2))./ sigma(2);
s_room = (3 - mu(3))./ sigma(3);
price = s_room * theta(3) + s_area * theta(2) + theta(1);

%normal equation (no preprocessing)

theta = inv(x' * x) * x' * y;
price = theta(1) + 1650 * theta(2) + 3 * theta(3);

%own data
%x1 = [720 2140 910 1155 1200 2400 1500 2900 800 1000 1100 1150 1200 1200 1200 900 950 800];
%x1 = [x1, 850 1000 1100 1200 1150 1050 1300 2400 2500 2700 2300 2100 1400 1450 1600 1800 2100];
%x1 = [x1, 2400 2700 2550 2150 1980 1750 2350 2400 2700 2850 1700 1600 1300 1100 950];
%x2 = [1 4 1 2 2  4 2 5 1 1 2 2 3 2 2 1 1 1 1 2 4 3 3 2 3 3 5 5 4 2 3 1 2 3 4 5 2 3 4 5 2 2 ];
%x2 = [x2, 3 3 1 2 4 3 3 2];
%x = [x1', x2'];

%y = [50000 80000 77000 72000 73000 60000 64000 74000 50000 55000 59000 63000 77000 81000 60000];
%y = [y, 63000 65000 67000 50000 52000 53000 51000 55000 52000 61000 72000 88000 89000 81000 82000];
%y = [y, 63000 64000 67000 66000 77000 74000 75000 74000 72000 68000 62000 81000 82000 93000 99000 65000 62000 61000 57000 50000];
%y = y'
