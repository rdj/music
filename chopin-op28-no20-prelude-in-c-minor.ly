\version "2.24.0"
\language "english"
\pointAndClickOff

%% Chopin uses regular and long >-shaped accent marks. The longer ones
%% I render with modified hairpins. See my comments in the source for
%% Waltz WN 47 [Op. posth. 69, No. 1] for more details.

long_accent_base = {
  \once \override Hairpin.endpoint-alignments = #'(-1 . -1)
  \once \override Hairpin.thickness = 2.0
  \once \override Hairpin.height = 0.4
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
}

long_accent_below = {
  \long_accent_base
  \once \override Hairpin.self-alignment-Y = -1
}

long_accent_above = {
  \long_accent_base
  \once \override Hairpin.self-alignment-Y = 1
}

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
  indent = 0
  % markup-system-spacing = #0
  % top-margin = #4
  % bottom-margin = #4
}

\header {
  title = "Prelude in c minor"
  subsubtitle = \markup { "No. 20 from" \italic "24 Préludes pour le Piano" "(1839)" }
  composer = "Frédéric Chopin"
  opus = "Op. 28, No. 20"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \consists "Span_stem_engraver"
    \accidentalStyle piano
    printKeyCancellation = ##f
  }
}

global = {
  \tempo Largo
  \key c \minor
  \time 4/4
}

upper = \relative {
  \clef treble

  <c' ef g>4^\(
  <c ef af>
  <ef g>8. <f d>16
  <c ef>4\) |

  <c ef>^\(
  <df f>
  <c ef>8. <bf df>16
  <af c>4\) |

  d^\( e g8. f16 <c ef>4 |
  <c d>
  <d g>
  <<
    { b'8. a16 } \\
    { <c, d fs>4 }
  >>
  <b d g>4\) |

  \repeat unfold 2 {
    <ef g ef'>^\(
    <ef af ef'>
    <<
      <d d'>4 \\
      { af'8. fs16 }
    >>
    <d g d'>4 |

    <c g' c>
    <c d fs d'>
    <d g b>8. <c a'>16
    <b d g>4 |

    <c g' c>
    <af! c af'>
    <<
      { g'8. f16 } \\
      <d g,>4
    >>
    <ef c g> |

    <c ef>
    <df f>
    ef8. d16
    c4\) |
  }

  <c ef g c>1\fermata
}

tenor = \relative {
  \crossStaff {
    g4
    af
  }
  <b g>
  \crossStaff {
    <g ef> |
    <af ef>
    <af f>
  }
  <g ef df>
  \crossStaff {
    <ef c> |
    <d f b>
    <e g bf c>
  }
  <af c>
  \crossStaff {
    g |
    <fs d>
    <b g>
    s4*2 |
  }

  \repeat unfold 2 {
    \crossStaff {
      s1*3 |
      <af ef>4
      <af f>
    }
    <b g f>
    \crossStaff {
      <g ef>
    }
  }
}

bass = \relative {
  <c c,>4
  <f, f,>
  <g g,>
  <c g c,> |

  <af af,>
  <df, df,>
  <ef ef,>
  <af af,> |

  <g g,>
  <c, c,>
  <f f,>
  <c' c,> |

  <d a d,>
  <g, g,>
  <d d,>
  <g g,> |

  \barNumberCheck #5

  \repeat unfold 2 {
    \once \stemUp <c c,>
    \shape #'((-1 . -0.5) (20 . 2) (-18 . -2.5) (1 . -3)) ^\(
    <c' c,>
    <b b,>
    <bf bf,> |

    <a a,>
    <af af,>
    <g g,>
    <f f,> |

    <ef ef,>
    <f f,>
    <b, b,>
    <c c,> |

    <af af,>
    <df, df,>
    <g g,>
    <c, c,>\) |
  }

  \barNumberCheck #13

  <c' g'>1_\fermata
}

lower = \relative {
  \clef bass
  <<
    \new Voice = "tenor" {
      \voiceOne
      \tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \bass
    }
  >>
}

above = {
  s1*2 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . RIGHT)
  s4\< s2. | s2 s4\! s4 |
  s1*6 |
  s2. s8 s8^\markup\italic { ritenuto }
}

between = {
  s1-\tweak extra-offset #'(-2 . 0) \ff | s1*3 |
  s1-\p | s1*3 |
  s1-\pp | s1 | s4
  \override DynamicTextSpanner.to-barline = ##t
  s4-\cresc s2 | s1 |
  \long_accent_below
  s4\!\> s4 s4\! s4
}

below = {
  s1*11 |
  s2. s4_\sustainOn
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% breaks_ref to match NE

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s1*4 |
  \break \barNumberCheck #5
  s1*4 |
  \break \barNumberCheck #9
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global
      \above
    }
    \new Staff = "up" {
      \global
      \upper
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \between
    }
    \new Staff = "down" {
      \global
      \lower
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #UP
    }{
      \global
      \below
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
