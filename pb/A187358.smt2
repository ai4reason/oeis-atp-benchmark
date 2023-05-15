;; sequence(s): A187358
;; terms: 1 14 429 16796 742900 35357670 1767263190 91482563640 4861946401452 263747951750360 14544636039226909 812944042149730764 45950804324621742364 2622127042276492108820 150853479205085351660700 8740328711533173390046320 509552245179617138054608572 29869166945772625950142417512
;; small program: loop((((1 + 2) * (x * y)) div (2 + y)) + x, (x + x) + x, 1)
;; fast program: loop((((1 + (y + y)) * 2) * x) div (2 + y), (x + x) + x, 1)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* (+ 1 2) (* x y)) (+ 2 y)) x))))
(assert (forall ((x Int)) (= (g0 x) (+ (+ x x) x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (div (* (* (+ 1 (+ y y)) 2) x) (+ 2 y)))))
(assert (forall ((x Int)) (= (g1 x) (+ (+ x x) x))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)