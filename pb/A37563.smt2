;; sequence(s): A37563
;; terms: 2 14 85 512 3074 18445 110672 664034 3984205 23905232 143431394 860588365 5163530192 30981181154 185887086925 1115322521552 6691935129314 40151610775885 240909664655312 1445457987931874
;; small program: loop(2 + ((2 * ((x + x) + x)) - ((y mod (1 + 2)) div 2)), x, 2)
;; fast program: loop((2 * ((x + x) + x)) + (if ((1 + y) mod (1 + 2)) <= 0 then 1 else 2), x, 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (- (* 2 (+ (+ x x) x)) (div (mod y (+ 1 2)) 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* 2 (+ (+ x x) x)) (ite (<= (mod (+ 1 y) (+ 1 2)) 0) 1 2)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
