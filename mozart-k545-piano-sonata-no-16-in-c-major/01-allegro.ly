% Append markup in the text property to the grob
#(define (append-markup grob old-stencil)
  (ly:stencil-combine-at-edge
    old-stencil X RIGHT (ly:text-interface::print grob)))

bassToTreble = {
  \clef treble
  % Fake staff clef appearance
  \once \override Staff.Clef.glyph-name = #"clefs.F"
  \once \override Staff.Clef.Y-offset = #1
  % Make sure any key signatures will printed with respect to
  % correct middle c position expected for bass clef
  \once \set Staff.middleCClefPosition = 6
  % Append change clef to the time signature
  \once \override Staff.TimeSignature.text = \markup {
    \hspace #1.2
    \lower #1
    \musicglyph "clefs.G_change"
  }
  \once \override Staff.TimeSignature.stencil = #(lambda (grob)
    (append-markup grob (ly:time-signature::print grob)))
}

Mov.1.global = {
  \key c \major
  \time 4/4
  \tempo Allegro
}

Mov.1.upper.A = {
  \relative c'' {
    \footnote "*" #'(1 . 1) \markup \tiny { \italic { * m.1: } First print edition has no dynamics. Mozart’s autograph score is considered lost. Editorial dynamics vary widely. }
    c2 e4 g |
    b,4.( c16 d) c4 r |
    a'2 g4 c |
    g
    <<
      { f8(\trill e16 f) e4 }

      \new Staff \with {
        \remove Time_signature_engraver
        alignAboveContext = "up"
        \magnifyStaff #2/3
        firstClef = ##f
      }
      {
        \tuplet 3/2 { f16[( g f] }
        e f) e4
      }
    >> r |
    a,8 b16 c d e f g a g f e d c b a |
    g8 a16 b c d e f g f e d c b a g |
    f8 g16 a b c d e f e d c b a g f |
    e8 f16 g a b c d e d c b a g f e |
    d8 e16 f g a b cs d a b cs d e f g |
    a b c b a g f e f g a g f e d c |
    b8[ g'] e[ c] d[ g] e[ c] |
    d4 <g d b> g, r |
    R1 |
    d''8( b) g4.( a16 b a8) g-! |
    g8.\trill( fs16) fs4 r2 |
    d'8( b) g4.( a16 b a8) g-! |
    g8.\trill( fs16) fs4 r2 |
    d'4 r16 d b g e4 r16 e g e |
    c'4 r16 c a fs d4 r16 d fs d |
    b'4 r16 b g e c4 r16 c e c |
    a'4 r16 a fs
    \footnote "*" #'(0.5 . 1) \markup \tiny { * \italic { m.21: } Some editions have C instead of B, see m. 66. (Muzyka; Peters, n.d., ca. 1938; Lafitte, 1909) }
    d b4 r16 g' d b |
    a2 \appoggiatura b16 c4 \appoggiatura ds16 e4 |
    \appoggiatura gs16 a4. b32( a gs a) c8( a) c( a) |
    b8( g) d'2 c16 b a g |
    \afterGrace 16/17 a1\startTrillSpan { g32[(\stopTrillSpan a]) } |
    g4 g16 d g b d b g b c a fs a |
    g4 g,16 d g b d b g b c a fs a |
    g4 <d' b'> <b g'> r |
  }
}

Mov.1.lower.A = {
  \relative c' {
    \bassToTreble
    \clef treble
    c8 g' e g c, g' e g |
    d g f g c, g' e g |
    c, a' f a c, g' e g |
    b, g' d g c, g' e g |
    f4 r r
    \clef bass
    <c f,> |
    <c e,> r r q |
    < \footnote "*" #'(0.5 . 0.5) \markup \tiny { * \italic { m.7: } Some editions have B instead of C; see mm. 48, 52. (Bärenreiter, 1986; Muzyka, n.d., ca. 1964) }
      c d,> r r <b d,> |
    <c c,> r r <e, c> |
    <a f>1 |
    f4. g8 a4. fs8 |
    g,16 b d g g, c e g g, b d g g, c e g |
    g,4 g' g, r |
    cs'16 d cs d cs d cs d c d c d c d c d |
    b d \repeat unfold 7 { b d } |
    c d b d a d b d c d b d c d a d |
    \repeat unfold 8 { b d } |
    c d b d a d b d c d b d c d a d |
    \clef treble
    r b d g b4 r16 c, e g c4 |
    r16 a, c fs a4 r16 b, d fs b4 |
    r16 g, b e g4 r16 a, c e a4 |
    r16 fs, a d fs4 r16 g, b d g4 |
    <e c>8 \repeat unfold 7 q |
    \grace s8 % Grace skip needed to avoid line-breaking warning with appoggiatura in upper voice
    <e c>8 \repeat unfold 7 q |
    \repeat unfold 4 { d16 b' g b } |
    \repeat unfold 4 { d, c' fs, c' } |
    <b g>4 r r <c a d,> |
    <b g> r r
    \clef bass
    <c, a d,> |
    <b g> <g g,> q r |
  }
}

Mov.1.upper.B = {
  \relative c'' {
    g4 g'16 d g bf d bf g bf c a fs a |
    g4 g,16 d g bf d bf g bf c a fs a |
    g4 r r16 g' bf a g f e d |
    cs4 r r16 cs' e d cs bf a g |
    f4 d16 a d f a f d f g e cs e |
    d4 d,16 a d f a f d f g e cs e |
    r d e f g a b cs d4 r |
    r16 b c d e fs gs a b4 r |
    r16 a e' d c b a g f4 r |
    r16 g d' c b a g f e4 r |
    r16 f c' b a g f e d4 r |
    r16 e b' a gs f e d c4 r |
    r16 bf d c bf a g f e f g a bf c d e |
  }
}

Mov.1.lower.B = {
  \relative c {
    <g g'>4 r r
    \clef treble
    <c'' a d,> |
    <bf g> r r
    \clef bass
    <c, a d,> |
    r16 g, a bf c d e fs g4 r |
    r16 a, b cs d e fs gs a4 r |
    <d, d,> r r
    \clef treble
    <g' e a,> |
    <f d> r r \clef bass <g, e a,> |
    <f d> r r16 d' f e d c b a |
    gs4 r r16 gs b a gs f e d |
    c4 r r16
    \clef treble
    d' a' g f e d c |
    b4 r r16 c g' f e d c b |
    a4 r r16
    \clef bass
    b f' e d c b a |
    gs4 r r16 a c b a g f e |
    d2 <bf' g c,> |
  }
}

Mov.1.upper.A′ = {
  \relative c'' {
    f2 a4 c |
    e,4.( f16 g) f4 r |
    d'2 c4 f |
    c bf8(\trill a16 bf) a4 r |
    d,8 e16 f g a bf c d c bf a g f e d |
    c8 d16 e f g a bf c bf a g f e d c |
    bf8 c16 d e f g a bf a g f e d c bf |
    a8 bf16 c d e f g a g f e d c bf a |
    a'4 r r <a c,> |
    <g c,> r r q |
    <
      f
      \footnote "*" #'(0.5 . 1) \markup \tiny { * \italic { m.52: } Some editions have B instead of C. (Muzyka) }
      c
    > r r <f b,> |
    <e c> r r <e c> |
    d16 d, e f g a b cs d a b cs d e f g |
    a b c b a g f e f g a g f e d c |
    b8[ g'] e[ c] d[ g] e[ c] |
    d4 <b d g> g r |
    R1 |
    g'8( e) c4.( d16 e d8) c-! |
    c8.(\trill b16) b4 r2 |
    g'8( e) c4.( d16 e d8) c-! |
    c8.(\trill b16) b4 r2 |
    g'4 r16 g e c a4 r16 a c a |
    f'4 r16 f d b g4 r16 g' b g e'4 r16 e c a f4 r16 f a f |
    d'4 r16 d b
    \footnote "*" #'(0.5 . 1) \markup \tiny { * \italic { m.66: } Some editions have F instead of G. (Muzyka) }
    g e4 r16 c' g e |
    d2 \appoggiatura cs16 d4 \appoggiatura cs16 d4 |
    a'2 \appoggiatura gs16 a4 \appoggiatura gs16 a4 |
    g8 a16 b c d e d c b a g f e d c |
    \afterGrace 16/17 d1\startTrillSpan { c32[(\stopTrillSpan d]) } |
    c4 c16 g c e g e c e f d b d |
    c4 c,16 g c e g e c e f d b d |
    c4 <c'' g e> c, r |
  }
}

Mov.1.lower.A′ = {
  \relative c' {
    \clef treble
    f8 c' a c f, c' a c |
    g c bf c f, c' a c |
    f, d' bf d f, c' a c |
    e, c' g c f, c' a c |
    bf4 r r
    \clef bass
    <f bf,> |
    <f a,> r r q |
    < \footnote "*" #'(0.5 . -0.25) \markup \tiny { * \italic { m.48: } Some editions have E instead of F. (Bärenreiter; Muzyka) }
      f
      g,> r r <e g,> |
    <f f,> r r2 |
    f,8 g16 a bf c d e f e d c bf a g f |
    e8 f16 g a b c d e d c b a g f e |
    d8 e16 f g a b c d c b a g f e d |
    c8 d16 e f g a b c b a g f e d c |
    <f a>1 |
    f4. g8 a4. fs8 |
    g,16 b d g g, c e g g, b d g g, c e g |
    g,4 g' g, r |
    \clef treble
    fs''16 g fs g fs g fs g f g f g f g f g |
    \repeat unfold 8 { e g } |
    f g e g d g e g f g e g f g d g |
    \repeat unfold 8 { e g } |
    f g e g d g e g f g e g f g d g |
    \clef bass
    r16 e, g c e4 r16 f, a c f4 |
    r16 d, f b d4 r16 e, g b e4 |
    \clef treble
    r16 c e
    \footnote "*" #'(0.25 . -3) \markup \tiny { * \italic { m.65: } Some editions have G instead of A (Meyer, 1872); considered an error. (Bärenreiter; Muzyka) }
    a c4 r16 d, f a d4 |
    r16 b, d g b4 r16 c, e g c4 |
    r8 <a f> q q q q q q |
    \clef bass
    r <ef c fs,> q q q q q q |
    g,16 e' c e \repeat unfold 3 { g,16 e' c e } |
    \repeat unfold 4 { g, f' b, f' } |
    <e c>4 r r <f d g,> |
    <e c> r r <f, d g,> |
    <e c> c' <c, c,> r |
  }
}

%% Breaks match Bärenreiter, 1986
Mov.1.reference.breaks = {
  s1*4 | \break
  \barNumberCheck #5
  s1*3 | \break
  \barNumberCheck #8
  s1*3 | \break
  \barNumberCheck #11
  s1*4 | \break
  \barNumberCheck #15
  s1*3 | \pageBreak
  \barNumberCheck #18
  s1*3 | \break
  \barNumberCheck #21
  s1*3 | \break
  \barNumberCheck #24
  s1*3 | \break
  \barNumberCheck #27
  s1*3 | \break
  \barNumberCheck #30
  s1*3 | \break
  \barNumberCheck #33
  s1*3 | \pageBreak
  \barNumberCheck #36
  s1*3 | \break
  \barNumberCheck #39
  s1*3 | \break
  \barNumberCheck #42
  s1*4 | \break
  \barNumberCheck #46
  s1*3 | \break
  \barNumberCheck #49
  s1*3 | \break
  \barNumberCheck #52
  s1*3 | \pageBreak
  \barNumberCheck #55
  s1*3 | \break
  \barNumberCheck #58
  s1*3 | \break
  \barNumberCheck #61
  s1*3 | \break
  \barNumberCheck #64
  s1*3 | \break
  \barNumberCheck #67
  s1*3 | \break
  \barNumberCheck #70
}

%% I. Allegro. C major. 4/4. Sonata form, AABA′BA′.
\score {
  \new PianoStaff \with { instrumentName = \markup { \abs-fontsize #18 { "16" } } } <<
    \new Staff = "up" {
      \clef treble
      \Mov.1.global
      \repeat volta 2 {
        \Mov.1.upper.A
      }
      \repeat volta 2
      {
        \Mov.1.upper.B
        \Mov.1.upper.A′
      }
    }
    \new Staff = "down" {
      \clef bass
      \Mov.1.global
      \Mov.1.lower.A
      \Mov.1.lower.B
      \Mov.1.lower.A′
    }
    \new Dynamics {
      \Mov.1.global
      \Mov.1.reference.breaks
    }
  >>
}
