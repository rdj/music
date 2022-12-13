Mov.2.global = {
  \key g \major
  \time 3/4
  \tempo Andante
}

Mov.2.upper.B = {
  \relative c'' {
    b4~ 16( g b d c a c e) |
    d8.( b16) g-. g-. a-. b-. c-. d-. e-. fs-. |
    g( fs g fs a g fs g fs e d cs) |
    d( b d b) g4 r |
    \stemUp c16( a c a) fs-! a( gs a as b c cs) \stemNeutral |
    d( b d b) g'4 r16 b16( fs g) |
    ds( e c a) g8. 16
    <<
      { b( a g a) } \\
      { fs4 }
    >> |
    <<
      { a4( g) } \\
      { \stemUp fs g \stemNeutral }  % some editions omit the F-sharp the first time, not footnoting it
    >> r |
  }
}

Mov.2.lower.B = {
  \relative c' {
    g16 d' b d g, d' b d a d c d | \break
    \repeat unfold 3 { g, d' b d } |
    g, e' c e g, e' c e g, cs as cs |
    \repeat unfold 3 { g d' b d } | \break
    \repeat unfold 3 { a d c d } |
    g, d' b d e, b' g b b, g' d g |
    c, a' e a d, b' g b d, c' a c |
    <<
      { c4( b) } \\
      g2
    >> r4 |
  }
}

Mov.2.upper.A = {
  \relative c'' {
    b2( d16 c b c) |
    d8.( b16) g4 r |
    g'4.( a16 g fs e d cs) |
    d8.( b16) g4 r |
    c8.( a16) fs8-.[ a-.] b-.[ c-.] |
    d8.( b16) g'4 r |
    a16( g fs g fs e ds e d c b c) |
    b8.( c32 b) a8( d cs c) |
    \Mov.2.upper.B
  }
}

Mov.2.lower.A = {
  \relative c' {
    \repeat unfold 2 { g16 d' b d } a d c d |
    \repeat unfold 3 { g, d' b d } |
    \repeat unfold 2 { g, e' c e } g, cs as cs | \break
    \repeat unfold 3 { g d' b d } |
    \repeat unfold 3 { a d c d } |
    g, d' b d e, b' g b b, g' d g | \break
    <<
      { e4 g2 | g4 fs } \\
      { c2 e4 | d2 }
    >> r4 |
    \Mov.2.lower.B
    \pageBreak
  }
}

Mov.2.upper.C = {
  \relative c'' {
    d4~ 16( cs e d g fs e d) |
    cs8.( d16) e4 r |
    e4~ 16( ds fs e a g fs e) |
    d?8.( e16) fs4 r |
    fs4~ 16( e g fs b a g fs) |
    e4~ 16( ds fs e a g fs e) |
    e( d?) d8~ 16 a d fs
    <<
      { fs e d e | e4( d16) ds e ds fs e d c } \\
      { cs4 | cs s2 }
    >> ||
    \Mov.2.upper.B
  }
}

Mov.2.lower.C = {
  \clef treble
  \relative c' {
    \repeat unfold 3 { d16 a' fs a } |
    \repeat unfold 3 { e a g a } |
    \repeat unfold 3 { cs, a' g a } | \break
    d, a' fs a cs, a' d, a' b, g' d g |
    \clef bass
    a, fs' d fs g, e' cs e fs, d' a d |
    b g' e g a, fs' ds fs g, e' b e | \break
    a, fs' d fs a, fs' d fs a, g' e g |
    <<
      { g4( fs) } \\
      d2
    >> r4 |
    \Mov.2.lower.B
  }
}

Mov.2.upper.D = {
}

Mov.2.lower.D = {
}

%% Movement II. Andante. G major. 3/4. AABBC
\score {
  \header {
    %% Do not repeat the opus
    piece = " "
    opus = " "
  }
  \new PianoStaff <<
    \new Staff = "up" {
      \clef treble
      \Mov.2.global
      \repeat volta 2
      {
        \Mov.2.upper.A
      }
      \repeat volta 2
      {
        \Mov.2.upper.C
      }
      \Mov.2.upper.D
    }
    \new Staff = "down" {
      \clef bass
      \Mov.2.global
      \Mov.2.lower.A
      \Mov.2.lower.C
      \Mov.2.lower.D
    }
  >>
}
