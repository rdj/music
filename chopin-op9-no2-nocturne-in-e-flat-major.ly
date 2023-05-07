\version "2.24.0"
\language "english"
\pointAndClickOff

fz = #(make-dynamic-script "fz")

%% Chopin uses regular and long >-shaped accent marks. The longer ones
%% I render with modified hairpins. See my comments in the source for
%% Waltz WN 47 [Op. posth. 69, No. 1] for more details.

long_accent_base = {
  \once \override Hairpin.endpoint-alignments = #'(-1 . -1)
  \once \override Hairpin.thickness = 2.0
  \once \override Hairpin.height = 0.4
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
  indent = 0
  % markup-system-spacing = #0
  % top-margin = #4
  % bottom-margin = #4
}

\header {
  title = "Nocturne in E-flat major"
  composer = "Frédéric Chopin"
  opus = "Op. 9, No. 2 (1832)"
  tagline = ##f
}

\layout {
  \context {
    \Score
    %%\override BarNumber.break-visibility = ##(#t #t #t) % to draw every bar number
    alternativeNumberingStyle = #'numbers-with-letters
    barNumberVisibility = #first-bar-number-invisible-save-broken-bars

    %% Put a bar line before the clef in the footnote variants
    \override SystemStartBar.collapse-height = #-inf.0

    %% Pedal marks by default have zero width, allowing, them to
    %% horizontally overlap. This restores their natural width so that
    %% \sustainOff can be arbitrarily close to \sustainOn but not run
    %% into it.
    \override SustainPedal.extra-spacing-width = #'(0 . 0)
  }

  \context {
    \PianoStaff
    \accidentalStyle default
    printKeyCancellation = ##f
  }
}

global = {
  \tempo Andante 8 = 132
  \key ef \major
  \time 12/8
  \partial 8
}

upper = \relative {
  \clef treble

  bf'8 |
  g'4.~ 8( f g f4. ef4) bf8 \shape #'((0 . -4) (9 . 5) (-5 . -3) (0 . -2.5)) ^( |

  g'4

  \once \override TextScript.avoid-slur = #'inside
  \once \override TextScript.outside-staff-priority = ##f
  \once \override TextScript.padding = #0
  c,8
  ^\markup { \hspace #0.60 \column { \center-align \line { \lower #1.75 \fontsize #-5 \flat } \line { \musicglyph #"scripts.turn" } \line { \raise #1.75 \fontsize #-5 \natural } } }

  c'4 g8 bf4. af4 g8) |

  f4. g4( d8) ef4.( c4.) |
  bf8( d') c( bf16 af g af) c,( d ef4.) r4

  bf8( |

  \barNumberCheck #5

  g'4. f16) g f\prall e f g f8 ef4~ 16 f ef\prall d ef f |
  g b, c df^>( c) f^>( e) af^>( g) df'( c g bf!4.) af4 g8 |
  f4.\startTrillSpan \grace { e16\stopTrillSpan f } g8-. g( d) ef4.( c4.) |
  bf8( d') c-.
  \shape #'((0 . 0) (0 . 0) (-1.75 . 2) (0 . -3))
  ^( bf16-. af-. g-. af-. \slashedGrace af c, d) ef4.~ 8 d( ef |

  \barNumberCheck #9
}

lower = \absolute {
  \clef bass
  r8 |

  ef,8-. <g ef'>(  <bf ef' g'>)
  ef-.   <af  d'>( <cf' d' af'>)
  ef,-.  <g ef'>(  <bf ef' g'>)
  d,-.   <g ef'>(  <bf ef' g'>) |

  c, <g e'> <bf e' g'>
  c  <g e'> <c' e' bf'>
  f, <f df'> <bf df' e'>
  f, <f c'> <af c' f'> |

  bf, <f d'!> <bf d' af'>
  b, <g f'> <d' f' g'>
  c <g ef'> <c' ef' g'>
  a, <gf ef'> <c' ef' gf'> |

  bf, <f ef'> <bf ef' af'>
  bf,, <f d'> <bf af'>
  ef,  <g ef'>  <bf ef' g'>
  ef  <g ef'>  <bf ef' g'> |

  \barNumberCheck #5

  ef-. <g ef'>(  <bf ef' g'>)
  ef-.   <af  d'>( <cf' d' af'>)
  ef-.  <g ef'>(  <bf ef' g'>)
  d-.   <g ef'>(  <bf ef' g'>) |

  c  <g e'> <bf e' g'>
  c  <g e'> <c' e' bf'>
  f, <f df'> <bf df' e'>
  f, <f c'> <af c' f'> |

  bf, <f d'!> <bf d' af'>
  b, <g f'> <d' f' g'>
  c <g ef'> <c' ef' g'>
  a, <gf ef'> <c' ef' gf'> |

  bf, <f ef'> <bf ef' af'>
  bf,, <f d'> <bf af'>
  ef,  <g ef'>  <bf ef' g'>
  ef  <g ef'>  <bf ef' g'> |
}

editorial.above = {
}

editorial.between = {
  s8^\markup \whiteout \italic { espress. dolce }  |
  s1. |
  \once \override Hairpin.self-alignment-Y = -2
  \once \override Hairpin.endpoint-alignments = #`(,RIGHT . ,LEFT)
  \once \override Hairpin.shorten-pair = #'(1 . 0)
  s8\< s8 s8 s8\! s4 s2.|
  s1. |
  s4. s8 s16 s16\f s8 s2. |

  \barNumberCheck #5
  s4.\p s4. s8 \long_accent_below s8\> s8\! s4. |
  s16\< s4 s16_\markup\italic{ cresc. } s4 s16 s16\!
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4.\> s4\! s8 |
}

pedal_off_late = {
  s16 s32 s32\sustainOff
}

ped_single = {
  s8\sustainOn s8 \pedal_off_late
}

ped_double = {
  s8\sustainOn s4 s4 \pedal_off_late
}

editorial.below = {
  s8 |
  \repeat unfold 3 {
    \repeat unfold 4 {
      \ped_single
    } |
  }
  \barNumberCheck #4
  \ped_single \ped_single s8\sustainOn s4 s4. |

  \barNumberCheck #5
  s8 s8 \pedal_off_late \repeat unfold 3 \ped_single |

  \barNumberCheck #6
  \ped_double \ped_single \ped_single |

  \barNumberCheck #7
  \repeat unfold 4 \ped_single |

  \barNumberCheck #8
  \ped_single \ped_single \ped_double |

  \barNumberCheck #9
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% breaks_ref to match NE

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s8 |
  s1.*2 |
  \break \barNumberCheck #3
  s1.*2 |
  \break \barNumberCheck #5
  s1.*2 |
  \break \barNumberCheck #7
  s1.*2 |
  \pageBreak \barNumberCheck #9
  s1.*2 |
  \break \barNumberCheck #11
  s1.*2 |
  \break \barNumberCheck #13
  s1.*2 |
  \break \barNumberCheck #15
  s1.*2 |
  \break \barNumberCheck #17
  s1.*3 |
  \pageBreak \barNumberCheck #20
  s1.*2 |
  \break \barNumberCheck #22
  s1.*2 |
  \break \barNumberCheck #24
  s1.*2 |
  \break \barNumberCheck #26
  s1.*2 |
  \pageBreak \barNumberCheck #28
  s1.*2 |
  \break \barNumberCheck #30
  %% ???
  % s2. s2. \afterGrace { \repeat unfold 40 { s16 } \break
  %                       \repeat unfold 20 { s16 }
  %                       s8 s8 s8 s8 } |
  % s1. |
  % s1. |
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global
      \editorial.above
    }
    \new Staff = "up" {
      \global
      \upper
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \editorial.between
    }
    \new Staff = "down" {
      \global
      \lower
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #UP
    }{
      \global
      \editorial.below
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
