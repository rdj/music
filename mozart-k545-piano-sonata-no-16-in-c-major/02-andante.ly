twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})
thrice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 3 $music #})

Mov.2.global = {
  \key g \major
  \time 3/4
  \tempo Andante
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
  }
}

Mov.2.lower.A = {
  \relative c' {
    \twice { g16 d' b d } a d c d |
    \thrice { g, d' b d } |
    \twice { g, e' c e } g, cs as cs |
    \thrice { g d' b d } |
    \thrice { a d c d } |
    g, d' b d e, b' g b b, g' d g |
    <<
      { e4 g2 | g4( fs) } \\
      { c2 e4 | d2 }
    >> r4 |
  }
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
      { fs4 } % some editions omit the F-sharp the first time, not footnoting it
    >> |
  }
}

Mov.2.lower.B = {
  \relative c' {
    g16 d' b d g, d' b d a d c d |
    \thrice { g, d' b d } |
    g, e' c e g, e' c e g, cs as cs |
    \thrice { g d' b d } |
    \thrice { a d c d } |
    g, d' b d e, b' g b b, g' d g |
    c, a' e a d, b' g b d, c' a c |
  }
}

Mov.2.upper.B_end = {
  \relative c'' {
    <<
      { a4( g) } \\
      { \stemUp fs( g) \stemNeutral }
    >> r |
  }
}

Mov.2.lower.B_end = {
  \relative c' {
    <<
      { c4( b) } \\
      g2
    >> r4 |
  }
}


Mov.2.upper.C = {
  \relative c'' {
    d4~ 16( cs e d g fs e d) |
    cs8.( d16) e4 r |
    e4~ 16( ds fs e a g fs e) |
    d8.( e16) fs4 r |
    fs4~ 16( e g fs b a g fs) |
    e4~ 16( ds fs e a g fs e) |
    e( d) d8~ 16 a( d fs)
    <<
      { fs( e d e) } \\
      { cs4 }
    >> |
    <e cs>4( d16)( ds e ds fs e d c) |
  }
}

Mov.2.lower.C = {
  \clef treble
  \relative c' {
    \thrice { d16 a' fs a } |
    \thrice { e a g a } |
    \thrice { cs, a' g a } |
    d, a' fs a cs, a' d, a' b, g' d g |
    \clef bass
    a, fs' d fs g, e' cs e fs, d' a d |
    b g' e g a, fs' ds fs g, e' b e |
    a, fs' d fs a, fs' d fs a, g' e g |
    <<
      { g4( fs) } \\
      d2
    >> r4 |
  }
}

Mov.2.upper.D = {
  \relative c'' {
    bf4~ 16( a c bf) bf( a g fs) |
    g8.( bf16) d4 r |
    d4~ 16( cs ef d) d( c bf a) |
    bf8.( d16) g4 r |
    f4~ 16( a c bf a g f ef) |
    d4~ 16( g bf a g f ef d) |
    b( c ef g) bf,8. 16
    <<
      { d( c bf c) } \\
      { a4 }
    >>
    <c a>4( bf16)( a c bf d c ef d)

    f4~ 16( af g f ef d c b) |
    c8.( ef16) g4 r |
    g4~ 16( fs a g) bf( cs, bf' cs,) |
    cs4( d) r |
    ef4~ 16( c a' fs c' a ef' fs,) |
    d'4~ 16( a bf fs g cs, d bf)
    bf( a c ef) g,8. 16
    <<
      { bf( a g a) } \\
      fs4
    >> |
    <a fs>4^( g16)( fs g gs a gs a as) |
  }
}

Mov.2.lower.D = {
  \relative c' {
    \twice { g16 d' bf d } a d c d |
    \thrice { g, d' bf d } |
    \twice { fs, d' a d } d, d' fs, d' |
    \twice {g, d' bf d } g, ef' bf ef |
    \thrice { a, f' c f } |
    bf, f' d f g, d' bf d d, bf' f bf |
    ef, c' g c f, d' bf d f, ef' c ef |
    <<
      { ef4( d) } \\
      { bf2 }
    >> r4 |

    af16 f' c f g, d' b d f, d' g, d' |
    ef, c' g c d, b' f b c, c' ef, c' |
    cs, bf' e, bf' d, bf' g bf ef, bf' g bf |
    d, bf' g bf \twice { d, a' fs a } |
    \thrice { c, a' fs a } |
    \thrice { bf, g' d g } |
    c, a' ef a d, bf' g bf d, c' a c |
    <<
      { c4( bf) } \\
      g2
    >> r4 |
  }
}

Mov.2.upper.Coda = {
  \relative {
    g'16( fs a g b a c b d c e d) |
    f4.( g16 a g f e d) |
    ds4( e) r16 g(fs e) |
    d( b a e') g,8. 16
    <<
      { b( a g a) } \\
      fs4
    >> |
    g16( fs a g b a c b d c e d) |
    f4.( g16 a g f e d) |
    e4 fs g |
    g,4. a32( g fs g)
    <<
      { b8 a } \\
      fs4
    >> |
    g16( d b') b-! b( g d') d-! d( b a b) |
    g( d b') b-! b( g d') d-! d( b a b) |
    g8 r <g b,> r r4 |
  }
}

Mov.2.lower.Coda = {
  \relative c' {
    <b g>4 r r |
    \clef treble
    \twice { a16 f' c f } b, g' d g |
    \thrice { c, g' e g } |
    b, d c e
    \clef bass
    d, b' g b d, c' a c |
    <b g>4 r r |
    a,16 f' c f b, g' d g g, g' b, g' |
    c, g' e g c, a' ef a cs, bf' e, bf' |
    \twice { d, b' g b } d, c' a c |
    <b g>4 r r8 <c d,>^(_( |
    <b g>4^)_) r r8 <c d,>^(_( |
    <b g>8^)_) r8 g, r r4 |
  }
}

%% Breaks match Bärenreiter, 1986
Mov.2.reference.breaks = {
  s2.*3 | \break
  \barNumberCheck #4
  s2.*3 | \break
  \barNumberCheck #7
  s2.*3 | \break
  \barNumberCheck #10
  s2.*3 | \break
  \barNumberCheck #13
  s2.*4 | \pageBreak
  \barNumberCheck #17
  s2.*3 | \break
  \barNumberCheck #20
  s2.*3 | \break
  \barNumberCheck #23
  s2.*3 | \break
  \barNumberCheck #26
  s2.*3 | \break
  \barNumberCheck #29
  s2.*4 | \pageBreak
  \barNumberCheck #33
  s2.*4 | \break
  \barNumberCheck #37
  s2.*3 | \break
  \barNumberCheck #40
  s2.*3 | \break
  \barNumberCheck #43
  s2.*4 | \break
  \barNumberCheck #47
  s2.*4 | \break
  \barNumberCheck #51
  s2.*4 | \pageBreak
  \barNumberCheck #55
  s2.*4 | \break
  \barNumberCheck #59
  s2.*3 | \break
  \barNumberCheck #62
  s2.*3 | \break
  \barNumberCheck #65
  s2.*3 | \break
  \barNumberCheck #68
  s2.*3 | \break
  \barNumberCheck #71
}

%% II. Andante. G major. 3/4. ABABCBCBDAB.
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
        \Mov.2.upper.B
        \Mov.2.upper.B_end
      }
      \pageBreak
      \repeat volta 2
      {
        \Mov.2.upper.C
        \Mov.2.upper.B
        \Mov.2.upper.B_end
      }
      \pageBreak
      \Mov.2.upper.D
      \Mov.2.upper.A
      \Mov.2.upper.B
      \Mov.2.upper.Coda
      \bar "|."
    }
    \new Staff = "down" {
      \clef bass
      \Mov.2.global
      \Mov.2.lower.A
      \Mov.2.lower.B
      \Mov.2.lower.B_end
      \Mov.2.lower.C
      \Mov.2.lower.B
      \Mov.2.lower.B_end
      \Mov.2.lower.D
      \Mov.2.lower.A
      \Mov.2.lower.B
      \Mov.2.lower.Coda
    }
    \new Dynamics {
      \Mov.2.global
      \Mov.2.reference.breaks
    }
  >>
}
