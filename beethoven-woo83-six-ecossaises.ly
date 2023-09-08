\version "2.24.0"
\language "english"
\pointAndClickOff

twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  % indent = 0
  % markup-system-spacing = #0
  % top-margin = #4
  % bottom-margin = #4
  ragged-right = ##f
  ragged-last = ##f
}

\header {
  title = "Six Écossaises"
  composer = "Ludwig van Beethoven "
  opus = "WoO 83 (ca. 1806)"
  tagline = ##f
}

\layout {
  \context {
    \Score
    %%\override BarNumber.break-visibility = ##(#t #t #t) % to draw every bar number
    alternativeNumberingStyle = #'numbers-with-letters
    barNumberVisibility = #first-bar-number-invisible-save-broken-bars
  }

  \context {
    \PianoStaff
    \accidentalStyle default
    printKeyCancellation = ##f

    %% Don't break beams between beat one and two
    beamExceptions = #'()
    baseMoment = #(ly:make-moment 1/2)
    beatStructure = #'(1)
  }
}

global = {
  \key ef \major
  \time 2/4
}

%% Each fits nicely on one page formatted in five lines

breaks_five_lines = {
  \autoLineBreaksOff
  s2 * 6 | \break
  \barNumberCheck #7 |
  s2 * 6 | \break
  \barNumberCheck #13 |
  s2 * 6 | \break
  \barNumberCheck #19 |
  s2 * 7 | \break
  \barNumberCheck #26 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% All six dances have the same refrain (the last two have a slightly
%% different first measure).

common.refrain_skip_first.upper = \relative {
  c'8( c') <ef, c'>4 |
  d <f d'> |
  ef8( ef') <g, ef'>4 |
  f <af f'> |
  g8( g') <bf, g'>4 |
  af8 af' f d |
  ef g ef bf |

  g4 <bf, bf'> |
  c8( c') <ef, c'>4 |
  d <f d'> |
  ef8( ef') <g, ef'>4 |
  f <af f'> |
  g8( g') <bf, g'>4 |
  af8 af' f d |
  ef4 r |
}

common.refrain.upper = \relative {
  \bar "||"
  ef'4 <bf bf'> |
  \common.refrain_skip_first.upper
}

common.refrain_skip_first.lower = \relative {
  af,,4 af' |
  bf bf, |
  c c' |
  d d, |
  ef ef' |
  bf bf, |
  ef ef' |
  <ef, ef'> <g g'> |
  af <c af'> |
  bf <f' bf> |
  c <g' c> |
  d <bf' d> |
  ef, <bf' ef> |
  bf, bf' |
  ef, ef, |
}

common.refrain.lower = \relative {
  g,4 g, |
  \common.refrain_skip_first.lower
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% No. 1

no.1.upper_repeated = \relative {
  g'8( bf) <g bf>4-! |
  <g c>8( bf) <g bf>4-! |
  <g ef'>8( bf) <g bf>4-! |
  <g c>8( bf) <g bf>4-! |
  <f d>8( bf) <bf d,>4-! |
  <g ef>8( bf) <bf ef,>4-! |
  <af f>8( bf) <bf f>4-! |
}

no.1.upper = {
  \no.1.upper_repeated
  \relative {
    bf'8( <f' af>) <f af>4-! |
  }
  \no.1.upper_repeated
  \relative {
    <f' d>8( bf) <bf d,>4-! |
  }
  \common.refrain.upper
}

no.1.between = {
  s2\p |
  s2 * 15 |
  \barNumberCheck #17
  s2\f
}

no.1.lower = \relative {
  \repeat unfold 4 {
    ef4 <g bf> |
  }
  bf, <f' bf> |
  bf, <g' bf> |
  bf, <af' bf> |
  bf, <bf' d> |
  \repeat unfold 4 {
    ef,4 <g bf> |
  }
  bf, <f' bf> |
  bf, <g' bf> |
  bf, <af' bf> |
  bf, bf' |
  \common.refrain.lower
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% No. 2

no.2.delayed_turn = \absolute {
  s8 s16
  \once \set suggestAccidentals = ##t
  \once \override AccidentalSuggestion.script-priority = -1
  \once \hideNotes
  b'16\turn
}

no.2.upper = \relative {
  \repeat unfold 2 {
    bf''8( g ef bf) |
    g4-! r |
  }
  <<
    \no.2.delayed_turn \\
    { \oneVoice bf'4 c8 bf }
  >>|
  af8( g f ef) |
  bf'( af f d) |
  bf( af f d) |

  \repeat unfold 2 {
    bf''8( g ef bf) |
    g4-! r |
  }
  <<
    \no.2.delayed_turn \\
    { \oneVoice bf'4 c8 bf }
  >>|
  af bf f bf |
  d, bf' bf, bf' |
  af, bf' f, bf' |

  \common.refrain.upper
}

no.2.between = {
  s2\p |
  s2 * 15 |
  s2\f
}

no.2.lower = \relative {
  \repeat unfold 6 {
    ef4 <g bf> |
  }
  \repeat unfold 2 {
    bf, <f' bf> |
  }
  \repeat unfold 5 {
    ef4 <g bf> |
  }
  \repeat unfold 3 {
    bf, <f' bf> |
  }
  \common.refrain.lower
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% No. 3

no.3.upper = \relative {
  <ef'' bf g ef>4 <d bf>8 <c af> |
  <bf g>4 q |
  <c af>8( <bf g> <c af> <a fs>) |
  <bf g>4 q |
  <af f> <af' f>8( <g ef>) |
  <f d>4-! <f d>8( <ef c>) |
  <d bf>4-! <d bf>8( <c af>) |
  <bf g>4 <af f> |

  <ef' bf g ef>4 <d bf>8 <c af> |
  <bf g>4 q |
  <c af>8( <bf g> <c af> <a fs>) |
  <bf g>2 |
  <af f>4 <c' af>8( <bf g> |
  <af f> <g ef> <f d> <ef c>) |
  <d bf>4-! <c af>-! |
  <bf g>-! <af f>-! |

  \common.refrain.upper
}

dyn_just_refrain = {
  s2*16 |
  s2\f
}
no.3.between = \dyn_just_refrain

no.3.lower = \relative {
  ef,4 <ef' g> |
  ef, <ef' g> |
  ef, <ef' af> |
  ef, <ef' g> |
  \repeat unfold 4 {
    bf, <bf' d> |
  }

  ef, <ef' g> |
  ef, <ef' g> |
  ef, <ef' af> |
  ef, <ef' g> |
  bf, <bf' d> |
  bf, <bf' d> |
  bf, bf' |
  bf, bf' |

  \common.refrain.lower
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% No. 4

no.4.upper = \relative {
  \repeat unfold 2 {
    r8 bf8 ef g |
    bf4( af) |
    r8 f af d |
    f4( ef) |
    r8 bf, ef g |
    bf4( af) |
    r8 af'8 f d |
    ef g ef bf |
  }

  \common.refrain.upper
}

no.4.between = \dyn_just_refrain

no.4.lower = \relative {
  \repeat unfold 2 {
    g,4 g' |
    f, f' |
    bf,, bf' |
    ef, ef' |
    g, g' |
    f, f' |
    bf,, bf' |
    ef, ef' |
  }

  \common.refrain.lower
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% No. 5

no.5.upper = \relative {
  <g'' bf,>4 q8 <f af,> |
  <ef g,>2 |
  <ef, g,>4 q8 <f bf,> |
  <g ef>4 r |
  r <af' f>8 <g ef> |
  <f d>2 |
  <f, d>8 <g ef> <af f> <bf g> |
  <c af>2 |

  <bf g>4 <g' bf,>8 <f af,> |
  <ef g,>2 |
  <ef, g,>4 q8 <f bf,> |
  <g ef>2 |
  r4 <af' f>8 <g ef> |
  <f d>2 |
  <f, d>8 <g ef> <af f> <bf g> |
  <c af>2 |

  \bar "||"
  <bf g>4 <bf bf,> |
  \common.refrain_skip_first.upper
}

no.5.between = \dyn_just_refrain

no.5.lower = \relative {
  \twice { ef4 <g bf> | }
  \twice { ef, <ef' g> | }
  \repeat unfold 4 { bf, <bf' d> | }
  \repeat unfold 4 { ef, <ef' g> | }
  \repeat unfold 4 { bf, <bf' d> | }
  \common.refrain.lower
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% No. 6

no.6.upper = \relative {
  <bf' g>4 \grace { c32 bf a } bf8 ef |
  <g, ef>2 |
  ef'4 \grace { f32 ef d } ef8 g |
  <bf, g>2 |

  bf8 g c bf |
  af g f ef |
  d ef f g |
  af bf c d |

  ef4 \grace { f32 ef d } ef8 g |
  <bf, g>2 |
  bf4 \grace { c32 bf a } bf8 ef |
  <g, ef>2 |

  bf8 g c bf |
  af g f ef |
  d ef f ef |
  d c bf af |

  \bar "||"
  g4 <bf bf'> |
  \common.refrain_skip_first.upper
}

no.6.between = \dyn_just_refrain

no.6.lower = \relative {
  \repeat unfold 4 {
    ef,4 <ef' g> |
  }
  g8 ef af g |
  c bf af g |
  f g af bf |
  c g af f |

  \repeat unfold 4 {
    ef,4 <ef' g> |
  }
  g8 ef af g |
  f ef d c |
  bf c d c |
  bf af g f |

  ef4 ef, |
  \common.refrain_skip_first.lower
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff \with {
    instrumentName = \markup { \abs-fontsize #18 { "1." } }
  } <<
    \new Staff = "up" {
      \global
      \clef treble
      \no.1.upper
      \bar "||"
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \no.1.between
    }
    \new Staff = "down" {
      \global
      \clef bass
      \no.1.lower
    }
    \new Dynamics {
      \global
      \breaks_five_lines
    }
  >>
}
\pageBreak

\score {
  \header {
    piece = " "
    opus = " "
  }
  \new PianoStaff \with {
    instrumentName = \markup { \abs-fontsize #18 { "2." } }
  } <<
    \new Staff = "up" {
      \global
      \clef treble
      \no.2.upper
      \bar "||"
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \no.2.between
    }
    \new Staff = "down" {
      \global
      \clef bass
      \no.2.lower
    }
    \new Dynamics {
      \global
      \breaks_five_lines
    }
  >>
}
\pageBreak

\score {
  \header {
    piece = " "
    opus = " "
  }
  \new PianoStaff \with {
    instrumentName = \markup { \abs-fontsize #18 { "3." } }
  } <<
    \new Staff = "up" {
      \global
      \clef treble
      \no.3.upper
      \bar "||"
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \no.3.between
    }
    \new Staff = "down" {
      \global
      \clef bass
      \no.3.lower
    }
    \new Dynamics {
      \global
      \breaks_five_lines
    }
  >>
}
\pageBreak

\score {
  \header {
    piece = " "
    opus = " "
  }
  \new PianoStaff \with {
    instrumentName = \markup { \abs-fontsize #18 { "4." } }
  } <<
    \new Staff = "up" {
      \global
      \clef treble
      \no.4.upper
      \bar "||"
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \no.4.between
    }
    \new Staff = "down" {
      \global
      \clef bass
      \no.4.lower
    }
    \new Dynamics {
      \global
      \breaks_five_lines
    }
  >>
}
\pageBreak

\score {
  \header {
    piece = " "
    opus = " "
  }
  \new PianoStaff \with {
    instrumentName = \markup { \abs-fontsize #18 { "5." } }
  } <<
    \new Staff = "up" {
      \global
      \clef treble
      \no.5.upper
      \bar "||"
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \no.5.between
    }
    \new Staff = "down" {
      \global
      \clef bass
      \no.5.lower
    }
    \new Dynamics {
      \global
      \breaks_five_lines
    }
  >>
}
\pageBreak

\score {
  \header {
    piece = " "
    opus = " "
  }
  \new PianoStaff \with {
    instrumentName = \markup { \abs-fontsize #18 { "6." } }
  } <<
    \new Staff = "up" {
      \global
      \clef treble
      \no.6.upper
      \bar "|."
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \no.6.between
    }
    \new Staff = "down" {
      \global
      \clef bass
      \no.6.lower
    }
    \new Dynamics {
      \global
      \breaks_five_lines
    }
  >>
}
\pageBreak
