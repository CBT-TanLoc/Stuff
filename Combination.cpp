#include <iostream>

using namespace std;

int n, k;
int a[100];

void print_ans() {
    for (int i = 1; i <= k; i++)
        cout << a[i] << char(32);
    cout << endl;
}

void Combination(int i, int n, int k) {
    for (int j = a[i - 1] + 1; j <= n - k + i; j++) {
        a[i] = j;
        if (i == k) print_ans(); 
            else Combination(i + 1, n, k);
    }
}

int main() {
    cout << "n, k: ";
    cin >> n >> k;

    a[0] = 0;
    Combination(1, n, k);
}