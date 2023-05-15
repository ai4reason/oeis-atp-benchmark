;; sequence(s): A167942-A168704-A168752-A168800-A168848-A168896-A168944-A168992-A169040-A169088-A169136-A169184-A169232-A169280-A169328-A169376-A169424-A169472-A169520-A169568-A170036-A170084-A170132-A170180-A170228-A170276-A170324-A170372-A170420-A170468-A170516-A170564-A170612-A170660-A170708-A170746
;; terms: 1 27 702 18252 474552 12338352 320797152 8340725952 216858874752 5638330743552 146596599332352 3811511582641152 99099301148669952 2576581829865418752 66991127576500887552 1741769316989023076352
;; small program: loop((loop(1 + (x * x), 2, 2) * x) + (1 div x), x, 1)
;; fast program: loop2(x * y, y, x - 1, 1, 2 + (2 * (2 * (2 + (2 + 2))))) * (if x <= 0 then 1 else (1 + (2 + (2 * (2 * (2 + (2 + 2)))))))
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ 1 (* x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (* v1 x) (div 1 x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (forall ((x Int)) (= (h2 x) (- x 1))))
(assert (= i2 1))
(assert (= j2 (+ 2 (* 2 (* 2 (+ 2 (+ 2 2)))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) i2 j2))))
(assert (forall ((x Int)) (= (fast x) (* (w2 x) (ite (<= x 0) 1 (+ 1 (+ 2 (* 2 (* 2 (+ 2 (+ 2 2)))))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)