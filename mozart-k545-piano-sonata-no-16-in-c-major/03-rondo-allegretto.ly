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
  r4 |
  <c' a>8-! q-! <a f> r |
  <b g>-! q-! <g e> r |
  f4. d8 |
  g r r4 |
  <c a>8-! q-! <f, d> r |
  <b g>-! q-! <e, c> r | \break
  <a f>4.( <g f'>8) |
  <e' c> c,
}

Mov.3.upper.B = \relative {
  r4
  \repeat unfold 4 R2
}

Mov.3.lower.B = \relative {
  r4
  \repeat unfold 4 R2
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
    }
    \new Staff = "down" {
      \Mov.3.global
      \clef bass
      \Mov.3.lower.A
      \Mov.3.lower.B
    }
  >>
}
