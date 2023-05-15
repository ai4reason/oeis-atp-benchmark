;; sequence(s): A319691
;; terms: 1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0
;; small program: if ((if ((1 + x) mod (1 + (2 + 2))) <= 0 then 1 else x) mod (2 + (2 + 2))) <= 0 then 1 else 0
;; fast program: loop(((((((x mod (1 + (2 + 2))) div 2) mod (1 + 2)) div 2) + 1) mod 2) + x, 1 - (x mod (2 + (2 + 2))), x) - x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (mod (ite (<= (mod (+ 1 x) (+ 1 (+ 2 2))) 0) 1 x) (+ 2 (+ 2 2))) 0) 1 0))))
(assert (forall ((x Int)) (= (f0 x) (+ (mod (+ (div (mod (div (mod x (+ 1 (+ 2 2))) 2) (+ 1 2)) 2) 1) 2) x))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod x (+ 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
