\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

\header {
  title = "Sonatina in C major"
  subsubtitle = \markup { "No. 1 from" \italic "Six Progressive Sonatinas for the Pianoforte" "(1797)" }
  composer = "Muzio Clementi"
  opus = "Op. 36, No. 1"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
    %% \override TupletBracket.bracket-visibility = ##t
    %% \override StaffGrouper.staff-staff-spacing.basic-distance = #10
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% I. Allegro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global.A = {
  \key c \major
  \time 2/2
  \tempo "Allegro"
}

upper.A = {
  \clef treble
  \repeat volta 2 \relative {
    c''4\(^2 e8 c g4\) g |
    c\( e8 c g4\) g'\( |
    f8 e d c^1 b^3 c^4 b c |
    d^5 c b a g4\) r |
    c4\( e8 c g4\) g |
    e'\( g8 e c4\) e8\( c |
    d b c a b g a fs |
    g a b c d e fs g\) |
    a,4( a') a a |
    b,8\( c d e fs g a b\) |
    c,4( c') c c |
    d,8\( g b d c b a g^1 |
    fs^3 e^2 g^4 fs^3 a g fs e^2 |
    e^4 d c b d^5 c b a |
    g2\) r |
  }
  \repeat volta 2 \relative {
    b'4^2\( d8 b g4\) g |
    c4\( ef8 c g4\) g'\( |
    f d ef c^1 |
    b8^2 c d b g4\) g |
    g'8\( g, g' g, g' g, g' g, |
    g' g, g' g, g' g, g' g, |
    d'^3 ef f d f ef d c |
    <b g'>4\) r r2 |
    c,4\( e8 c g4\) g |
    c\( e8 c g4\) g'\( |
    f8 e d c b c b c |
    d c b a g4\) r |
    c^2\( g8^1 c^2 e4^4\) e |
    e^2\( c8 e g4^3\) c^5 |
    <g^3 e^1>-. <f^4 d^2>-. <e^3 c^1>-. <d^4 b^2>-. |
    c8\( d e f g a b c\) |
    d,4( d') d d |
    e,8\( f g a b c d e\) |
    f,4( f') f f |
    g,8\( c e g f e d c\) |
    a'\( g f e d^1 c^4 b a |
    g^1 a^4 f^2 g^3 e^1 f^4 d^2 e^3 |
    c4\) r r2 |
  }
}

lower.A = \relative {
  \clef bass

  \relative {
    c4 r r2 |
    c4 r r2 |
    c4 r c r |
    g r g'8\( f e d |
    c4\) r r2 |
    c'4 r r fs,_2 |
    g c,_4 d_1 d, |
    g r r2 |
    fs'8 d' a d fs, d' a d |
    g,4 r r2 |
    a8 d c d a d c d |
    b4 r r2 |
    c4 r c, r |
    d r d, r |
    g8\( b d g g,4\) r |
  }

  \relative {
    f'1\( |
    ef |
    b2 c |
    g\) r |
    f'4 g, d' g, |
    ef' g, c g |
    b r c r |
    g g, g'8\( f e d |
    c4\) r r2 |
    c4 r r2 |
    c4 r c r |
    g r g8\( f e d |
    c4\) r r2 |
    c'4 r r2 |
    g'4 r g, r |
    c r r2 |
    b8 g' d g b, g' d g |
    c,4 r r2 |
    d8 g f g d g f g |
    e4 r r2 |
    f4 r f r |
    g r g, r |
    c,8\( e g c c,4\) r |
  }
}

editorial.above.A = {
  %% marks above the grand staff
}

editorial.between.A = {
  %% marks between the staves, e.g. dynamics
  s4\f s2. |
  s1 * 2 |
  s2 s8\> s4 s8\! |
  s4\p s2. |
  s1 * 2 |
  s8\< s8 s2 s8 s8\! |
  s4\f s2. |
  s1 * 6 |
  s4\p s2. |
  s1 * 3 |
  s8\f s8 s2. |
  s1 * 2 |
  s2 s8\> s4 s8\! |
  s4\p s2. |
  s1 * 6 |
  s8\< s2. s8\! |
  s4\f s2. |
  s1 * 6 |
}

editorial.below.A = {
  %% marks below the grand staff, e.g. pedal marks
}

breaks_ref.A = {
  %% breaks matching some reference for ease of authoring
  s1 * 4 | \break
  \barNumberCheck #5
  s1 * 4 | \break
  \barNumberCheck #9
  s1 * 4 | \break
  \barNumberCheck #13
  s1 * 3 | \pageBreak
  \barNumberCheck #16
  s1 * 4 | \break
  \barNumberCheck #20
  s1 * 5 | \break
  \barNumberCheck #25
  s1 * 5 | \break
  \barNumberCheck #30
  s1 * 5 | \break
  \barNumberCheck #35
  s1 * 4 | \pageBreak
}

\score {
  \new PianoStaff \with { instrumentName = \markup { \abs-fontsize #18 { "1." } } } <<
    \new Dynamics {
      \global.A
      \editorial.above.A
    }
    \new Staff = "up" {
      \global.A
      \upper.A
    }
    \new Dynamics {
      \global.A
      \editorial.between.A
    }
    \new Staff = "down" {
      \global.A
      \lower.A
    }
    \new Dynamics {
      \global.A
      \editorial.below.A
    }
    \new Dynamics {
      \global.A
      \breaks_ref.A
    }
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% II. Andante
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

trip = #(define-music-function (music) (ly:music?) #{ \tuplet 3/2 4 #music #})

global.B = {
  \key f \major
  \time 3/4
  \tempo "Andante"
}

upper.B = \relative {
  \clef treble

  \omit TupletNumber

  c''2\( f4 |
  a,2 c4 |
  f,2 \afterGrace g4\trill { f16 g } |
  a4\) \trip { f8\( a c f f f } |
  d4\) \trip { f,8\( bf d f f f } |
  c4\) \trip { a'8\( g f e d c\) } |
  \trip { c\( e, g\) c\( f, a\) c\( f, a\) } |
  c8.\fz\( a16 g4\) r |
  \trip { <f' d>8\( q q <e c> q q <d b> q q } |
  g4\) \trip { g,8\( a b c d e |
  a, f' d\) <c e,>\( q q <b d,> q q\) } |
  <d f,>2( <c e,>4^!) |

  \trip { c8\( c c ef d c bf a g |
  fs\)\( a d,\) g\( bf d,\) a'\( c d,\) |
  bf'\( bf bf d c bf a g f |
  e\)\( g c,\) f\( a c\) <c a> <bf g> <a f> } |
  q4( \trip { <g e>8) <c a> q q <bf g> <a f> } |
  <a f>4( <g e>) r |

  c2\(
  f4 |
  a,2 c4 |
  ef,2
  \once \override Script.avoid-slur = #'inside
  \afterGrace ef4\trill { d16 ef } |
  \trip { d8 f bf d d d } d4\) |
  \trip { <bf g>8\( q q <a f> q q <g e> q q\) } |
  c8.( f,16) \trip { f'8\( e d c bf a |
  g bf d } f,4 g\trill |
  f2.\) |
}

lower.B = \relative {
  \clef bass
  \tuplet 3/2 { f8 a c }
  \omit TupletNumber
  \repeat unfold 5 \trip { f, a c } |
  \trip { c, f a c, f a c, e g } |
  \trip { f a c } r4 r |
  \trip { f,8 bf d } r4 r |
  \repeat unfold 3 \trip { f,8 a c } |
  bf4 a f |
  \trip { c8 f a c, e g c, e g } |
  g,2 f'4 |
  \trip { e8 g c } e,2 |
  f4 g g, |
  c,\( g' c\) |

  R2. |
  c'4 bf fs |
  g r r |
  bf a f |
  \trip { c8 c' c } c4 r |
  \trip { c,8 c' c c\( d c bf a g |
  f\) a c \repeat unfold 8 { f, a c } } |
  bf2 r4 |
  c,,2 bf'4 |
  \trip { \repeat unfold 3 { a8 c f } |
  bf, d g c, f a c, e g |
  f,\( a c f c a } f4\) |
}

editorial.above.B = {
  %% marks above the grand staff
}

editorial.between.B = {
  s2\pp s1 |
  s2. * 4 |
  s4 s4_\markup { \italic "cresc." } s4 |
  s4 s4\p s4 |
  s2. |
  s4\f s2 |
  s2. * 2 |
  \repeat unfold 2 {
    \trip { s8\< s8 s8\! s8\> s8 s8\! } s4\p |
    s2. |
  }
  s2. * 5 |
  \trip { s8^\markup \italic { dim. } s8 s8 s8\p s8 s8 } s4 |
  s4 s4_\markup \italic { cresc. } s4 |
  s4\f s4 s4 |
  s2. * 2 |
  %% marks between the staves, e.g. dynamics
}

editorial.below.B = {
  %% marks below the grand staff, e.g. pedal marks
}

breaks_ref.B = {
  %% breaks matching some reference for ease of authoring
  s2. * 3 | \break
  \barNumberCheck #4
  s2. * 3 | \break
  \barNumberCheck #7
  s2. * 3 | \break
  \barNumberCheck #10
  s2. * 3 | \pageBreak
  \barNumberCheck #13
  s2. * 3 | \break
  \barNumberCheck #16
  s2. * 3 | \break
  \barNumberCheck #19
  s2. * 4 | \break
  \barNumberCheck #23
  s2. * 4 | \pageBreak
}

\score {
  \header {
    %% Do not repeat the opus
    piece = " "
    opus = " "
  }
  \new PianoStaff <<
    \new Dynamics {
      \global.B
      \editorial.above.B
    }
    \new Staff = "up" {
      \global.B
      \upper.B
      \bar "|."
    }
    \new Dynamics {
      \global.B
      \editorial.between.B
    }
    \new Staff = "down" {
      \global.B
      \lower.B
    }
    \new Dynamics {
      \global.B
      \editorial.below.B
    }
    \new Dynamics {
      \global.B
      \breaks_ref.B
    }
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% III. Vivace
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global.C = {
  \key c \major
  \time 3/8
  \tempo "Vivace"
}

upper.C = \relative {
  \clef treble
  e''16\( d c8\) c |
  g'4\( f16 e\) |
  d8 f b, |
  c g g |
  e'16\( d c8\) c |
  g'4\( f16 e |
  d e f e f d |
  c8-.\) r r |

  e16\( d c8\) c |
  g'4\( f16 e\) |
  d8 f b, |
  c g g |
  e'16\( d c8\) c |
  g'4\( f16 e |
  d e f e f d |
  c8-.\) r r |

  g16\( f e8\) e |
  a16\( g f8\) f |
  d16\( f b f b f |
  e8 g c\) |

  g16\( f e8\) e |
  e'16\( d c8\) c |
  fs,16\( g a b c a
  g8\) r b'16\( c |
  d c b a g fs |
  e d c b a g |
  fs g a b c a |
  g8\) r b'16\( c |
  d c b a g fs |
  f8\) f d'16\( b |
  f8\) f d'16\( b |
  f8\) r r |
  d r r |

  b16\( g a b c d |
  e\)\( d c8\) c |
  g'4\( f16 e\) |
  d8 f b, |
  c g g |
  e'16\( d c8\) c |
  g'4\( f16 e |
  d e f e f d |
  c8-.\) r r |

  e16\( d c8\) c |
  g'4\( f16 e\) |
  d8 f b, |
  c g g |
  e'16\( d c8\) c |
  g'4\( f16 e |
  d e f e f d |
  c8-.\) r r |

  \repeat unfold 2 {
    g16\( f e8\) e |
    a16\( g f8\) f |
    d16\( f b f b f |
    e8\) r e'16\( f |
    g f e d c b |
    a g f e d c |
    b c d e f d |
    c8\) r r |
  }

  <e g>8 r r |
  <e g c>8 r r |
  <e' g>8 r r |
  <e g c>4 r8 |
}

lower.C = \relative {
  \clef bass
  c8_4  e g |
  c, e g |
  c, d f |
  \repeat unfold 3 { c e g | }
  g, d' g |
  \repeat unfold 3 { c, e g | }
  c, d f |
  \repeat unfold 3 { c e g | }
  g, d' g |
  c, e g |
  c4 r8 |
  c4 r8 |
  c8 c c |
  c c c |
  c4 r8 |
  <c a>4 r8 |
  <a d,>8 q q |
  <b g>8 q q |
  q q q |
  <c g> q q |
  q q q |
  <b g> q q |
  q q q |
  q r r |
  q r r |
  g b d |
  g, b d |
  g,4 r8 |

  \repeat unfold 2 { c,8 e g | }
  c, d f |
  \repeat unfold 3 { c e g | }
  g, d' g |
  \repeat unfold 3 { c, e g | }
  c, d f |
  \repeat unfold 3 { c e g | }
  g, d' g |
  c, e g |
  c4 r8 |
  c4 r8 |
  c8 c c |
  c g e |
  c d e |
  f4 r8 |
  g,4 r8 |
  c8 e g |
  c4 r8 |
  c4 r8 |
  c8 c c |
  c g e |
  c d e |
  f f f |
  g, g g |
  \repeat unfold 4 { c e g | }
  c,4 r8 |
}

editorial.above.C = {
  %% marks above the grand staff
}

editorial.between.C = {
  %% marks between the staves, e.g. dynamics
  s4. * 8 |
  \barNumberCheck #9
  s8\f s4 |
  s4. * 7 |
  \barNumberCheck #17
  s8\p s4 |
  s4. |
  \barNumberCheck #19
  s8\f s4 |
  s4. |
  \barNumberCheck #21
  s8\p s4 |
  s4. |
  \barNumberCheck #23
  s8\f s4 |
  s4. * 7 |
  \barNumberCheck #31
  s8 s8 s8-\markup \italic { dim. } |
  s4. |
  \barNumberCheck #33
  s8\p s4 |
  s4. |
  \barNumberCheck #35
  s8\pp s4 |
  s4. * 7 |
  \barNumberCheck #43
  s8\f s4 |
  s4. * 7 |
  \barNumberCheck #51
  s8\p s4 |
  s4. |
  \barNumberCheck #53
  s8\f s4 |
  s4. * 5 |
  \barNumberCheck #59
  s8\p s4 |
  s4. |
  s8\f s4 |
  s4. * 4 |
  \barNumberCheck #66
  s8\ff s4 |
  s4. * 4 |
}

editorial.below.C = {
  %% marks below the grand staff, e.g. pedal marks
  s8_\markup \italic { legato }
}

breaks_ref.C = {
  %% breaks matching some reference for ease of authoring
  s4. * 6 | \break
  \barNumberCheck #7
  s4. * 6 | \break
  \barNumberCheck #13
  s4. * 6 | \break
  \barNumberCheck #19
  s4. * 5 | \break
  \barNumberCheck #24
  s4. * 5 | \break
  \barNumberCheck #29
  s4. * 6 | \pageBreak
  \barNumberCheck #35
  s4. * 6 | \break
  \barNumberCheck #41
  s4. * 6 | \break
  \barNumberCheck #47
  s4. * 6 | \break
  \barNumberCheck #53
  s4. * 6 | \break
  \barNumberCheck #59
  s4. * 6 | \break
  \barNumberCheck #65
  s4. * 6 |
}

\score {
  \header {
    %% Do not repeat the opus
    piece = " "
    opus = " "
  }
  \new PianoStaff <<
    \new Dynamics {
      \global.C
      \editorial.above.C
    }
    \new Staff = "up" {
      \global.C
      \upper.C
      \bar "|."
    }
    \new Dynamics {
      \global.C
      \editorial.between.C
    }
    \new Staff = "down" {
      \global.C
      \lower.C
    }
    \new Dynamics {
      \global.C
      \editorial.below.C
    }
    \new Dynamics {
      \global.C
      \breaks_ref.C
    }
  >>
}
