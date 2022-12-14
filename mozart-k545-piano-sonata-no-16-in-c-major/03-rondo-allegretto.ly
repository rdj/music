twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})
thrice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 3 $music #})
simile = \markup { \italic simile }

Mov.3.global = {
  \key c \major
  \time 2/4
  \tempo Allegretto
}

Mov.3.upper.A = \relative {
  <g'' e>8-! q-! |
  <e c> r <f d>-! q-! |
  <d b> r c16( d e c a b c cs d e f d) |
  c( b a g) <g' e>8-! q-! |
  <e c> r <a f>-! q-! |
  <d, b> r a'16( g f e) |
  cs( d e f)
  a,( c b d) |
  c8 r
}

Mov.3.lower.A = \relative {
  <c' a>8-! q-! <a f> r |
  <b g>-! q-! <g e> r |
  f4. d8 |
  g r r4 |
  <c a>8-! q-! <f, d> r |
  <b g>-! q-! <e, c> r |
  <a f>4.( <g f'>8) |
  <e' c> c,
}

Mov.3.upper.B = \relative {
  e''16( fs g) g-! |
  a( g fs e) d-. d-. d-. d-. |
  e( d c b) e'( d c b) |
  gs( a b c) e,( fs g a) |
  g( fs e d) <d' b>8-! q-! |
  <b g> r <c a>-! q-! |
  <a fs> r g16( a b g) |
  ds( e g e d b c a) |
  g8 r g16( a b c |
  d8) r b16( c d e |
  f8) r d16( e f g |
  a8)[ af-! g-! fs-!] |
  f r
}

Mov.3.lower.B = \relative {
  \clef treble
  c'16 g' e g |
  b, g' d g
  \clef bass
  fs, d' a d |
  g, d' b d b, g' d g |
  c, a' e a cs, a' e a |
  d,8 r r4 |
  \clef treble
  <g' e>8-! q-! <e c> r |
  <fs d>-! q-! <d b> r |
  \clef bass
  <<
    { g,4. fs8 } \\
    { c4 d }
  >> |
  g8 g, r4 |
  <b' g>8 g, r4 |
  <g' b>8 g, r4 |
  R2 |
  R2 |
}

Mov.3.upper.C = \relative {
  r4 |
  e''16( ds f e) r4 |
  e16( ds f e) <e c'>8-! q-! |
  <c a'> r <d b'>-! q-! |
  <gs b,> r a16( e c a) |
  c( bf) bf bf d( cs) cs cs |
  e( d) f( e) g( f) f( e) |
  e( ds) c'4( ds,8) |
  e r b'16( gs e d) |
  c( e a gs a e c a) |
  gs( b e gs) b( gs e d) |
  c e a gs a e c a |
  e8 r <e' c>-! q-! |
  <c a> r <d b>-! q-! |
  <b gs> r r4 |
  e,16( ds f e) r4 |
  e''16( ds f e d cs e d) |
  d( c) c( b) b( a) a( g) |
  g( f) f( e) e( d) d( c) |
  bf( f' d bf) a8 gs |
  \thrice { a8 r gs16( d' b gs) | }
  a( e' c a) b( f' d b) |
  r4\fermata
}

Mov.3.lower.C = \relative {
  <e' c>8-! q-! |
  <c a> r <d b>-! q-! |
  <b gs> r r4 |
  e16( ds f e) r4 |
  e16( ds f e)
  \clef treble
  <e c>4 |
  <f d> <g e> |
  <<
    a2 \\
    { f8[ cs d e] }
  >> |
  <a f>8 r q r |
  \clef bass
  \twice {
    e,16 e' gs, e' b e gs, e' |
    e, e' a, e' c e a, e' |
  }
  e,8 r r4 |
  e'16( ds f e) r4 |
  e16( ds f e) <c e,>8-! q-! |
  <a c,> r <b d,>-! q-! |
  <gs b,> r <b gs>4 |
  <c a>8 <d b>
  \clef treble
  <<
    {
      e4 |
      a2 |
      f4
      \clef bass
      c8 b
    } \\
    {
      c8 cs |
      d e f e |
      d4 e,
    }
  >> |
  \thrice { a16( c e c e, b' d b) | }
  a16( c e c g d' f d) |
  r4\fermata
}

Mov.3.upper.coda = \relative {
  b'16( f' d b) |
  a'( g f e) d( f d b) |
  a'( g f e) d'( c b a) |
  a( g) f-. e-. e( d) c-. b-. |
  d8( c) b16( f' d b) |
  a'( g f e) d( f d b) |
  a'( g f e) d'( c b a) |
  a( g) f-. e-. e( d) c-. b-. |
  \twice {
    c e g, c e, g c, e |
    g c <e c> <g e> <g e>( <f d>) <e c>-. <d b>-. |
  }
  c8 <e g c> <c e,> q |
  q4 r |
}

Mov.3.lower.coda = \relative {
  f16( b g b) |
  e,^\simile c' g c f, b g b |
  e, c' g c f, d' a d |
  g, e' c e g, f' d f |
  c g' e g f, b g b |
  e, c' g c f, b g b |
  e, c' g c f, d' a d |
  g, e' c e g, f' d f |
  \twice {
    c e g, c e, g c, e |
    g8 r g, r |
  }
  <c c,>[ <e e,> <g g,> <e e,>] |
  <c c,>4 r |
}

%% Breaks match Bärenreiter-Verlag, 1986
Mov.3.reference.breaks = {
  s4 |
  s2*6 | \break
  \barNumberCheck #7
  s2*5 | \break
  \barNumberCheck #12
  s2*6 | \break
  \barNumberCheck #18
  s2*7 | \break
  \barNumberCheck #25
  s2*7 | \break
  \barNumberCheck #32
  s2*6 | \pageBreak
  \barNumberCheck #38
  s2*6 | \break
  \barNumberCheck #44
  s2*6 | \break
  \barNumberCheck #50
  s2*7 | \break
  \barNumberCheck #57
  s2*6 | \break
  \barNumberCheck #63
  s2*5 | \break
  \barNumberCheck #68
}

\score {
  \header {
    piece = \markup { \caps "Rondo." }
    opus = ##f
  }
  \new PianoStaff <<
    \new Staff = "up" {
      \Mov.3.global
      \clef treble
      \partial 4
      \repeat volta 2 {
        \Mov.3.upper.A
      }
      \Mov.3.upper.B
      \Mov.3.upper.A
      \Mov.3.upper.C
      \Mov.3.upper.A
      \Mov.3.upper.coda
      \bar "|."
    }
    \new Staff = "down" {
      \Mov.3.global
      \clef bass
      r4 \Mov.3.lower.A
      \Mov.3.lower.B
      \Mov.3.lower.A
      \Mov.3.lower.C
      r4 \Mov.3.lower.A
      \Mov.3.lower.coda
    }
    \new Dynamics {
      \Mov.3.global
      \Mov.3.reference.breaks
    }
  >>
}
