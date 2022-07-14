#include <iostream>

using namespace std;

int chess, x, y;
int a[8][8];
int mv_x[8] = {-2, -1, 1, 2, 2, 1, -1, -2}; // move x
int mv_y[8] = {1, 2, 2, 1, -1, -2, -2, -1}; // move y

void init() {
    for (int i = 0; i <= chess - 1; i++)
        for (int j = 0; j <= chess - 1; j++) {
            a[i][j] = 0;
        }
};

void print_ans() {
    for (int i = 0; i <= chess - 1; i++) {
        for (int j = 0; j <= chess - 1; j++) {
            cout << a[i][j] << " ";    
        }
        cout << endl;
    }
    cout << endl;
};

void move(int n, int x, int y) {
    for (int i = 0; i <= 7; i++) {
        int r = x + mv_x[i]; // new x to move
        int c = y + mv_y[i]; // new y to move
        if ((r >= 0) && (r <= chess - 1) && (c >= 0) && (c <= chess - 1) && (a[r][c] == 0)) {
            a[r][c] = n; // mark moved
            if (n == chess * chess) print_ans(); else move(n + 1, r, c);
            a[r][c] = 0; // unmask moved
        }
    }
}

int main() {
    
    cout << "Chess: ";
    cin >> chess;
    cout << "Row and Column: ";
    cin >> x >> y;

    init();
    a[x][y] = 1;

    move(2, x, y);
}