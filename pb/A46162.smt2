;; sequence(s): A46162
;; terms: 0 1 4 3 16 25 12 49 64 27 100 121 48 169 196 75 256 289 108 361
;; small program: (x div (1 + (if (x mod (1 + 2)) <= 0 then 2 else 0))) * x
;; fast program: loop(x div (1 + 2), 1 - (x mod (1 + 2)), x) * x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (div x (+ 1 (ite (<= (mod x (+ 1 2)) 0) 2 0))) x))))
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 2)))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod x (+ 1 2))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
