param T > 0;

param demand {1..T} >= 0;
param onhand0 >= 0;
param backorder0 >= 0;
param worker0 >= 0;

var hiring {1..T} integer >= 0;
var firing {1..T} integer >= 0;
var regular {1..T} >= 0;
var overtime {1..T} >= 0;
var onhand {0..T} >= 100;
var backorder {0..T} >= 0;
var worker {0..T} integer >= 0;

minimize Total_Cost: sum {p in 1..T} (200 * hiring[p] + 100 * firing[p] + 8 * onhand[p] + 15 * backorder[p] + 160 * 7 * worker[p] + 11 * 4 * overtime[p]);

subject to Equality {p in 1..T}:
	onhand[p-1] - backorder[p-1] + regular[p] + overtime[p] - onhand[p] + backorder[p] = demand[p];

subject to Equality2 {p in 1..T}:
	worker[p-1] + hiring[p] - firing[p] -worker[p] = 0;

subject to Balance {p in 1..T}:
	regular[p] <= 160 / 4 * worker[p];

subject to Balance2 {p in 1..T}:
	overtime[p] <= 160 / 8 * worker[p];

subject to Init_Onhand: onhand[0] = onhand0;
subject to Init_Backorder: backorder[0] = backorder0;
subject to Init_Worker: worker[0] = worker0;







