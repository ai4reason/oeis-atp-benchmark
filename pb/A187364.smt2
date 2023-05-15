;; sequence(s): A187364
;; terms: 1 35 1716 92378 5200300 300540195 17672631900 1052049481860 63205303218876 3824345300380220 232714176627630544 14226520737620288370 873065282167813104916 53753604366668088230810 3318776542511877736535400 205397724721029574666088520
;; small program: loop(2 * ((x - (x div (1 + y))) + x), (x + x) + x, 2) div 2
;; fast program: loop((((2 * (y + y)) - 2) * x) div (1 + y), (x + x) + x, 1) * (1 + (2 * ((x + x) + x)))
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (+ (- x (div x (+ 1 y))) x)))))
(assert (forall ((x Int)) (= (g0 x) (+ (+ x x) x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (div (* (- (* 2 (+ y y)) 2) x) (+ 1 y)))))
(assert (forall ((x Int)) (= (g1 x) (+ (+ x x) x))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (* (v1 x) (+ 1 (* 2 (+ (+ x x) x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)