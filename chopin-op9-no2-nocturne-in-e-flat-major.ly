\version "2.24.0"
\language "english"
\pointAndClickOff

fz = #(make-dynamic-script "fz")
fzp = #(make-dynamic-script "fz p")

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

    \omit TupletBracket
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
  f4.) g4( ef8) f4.( c4.) |
  ef8-.( ef-. ef-. ef) d16( ef f16. ef32 ef4.) bf |
  bf'( a4 g8 <f a,>4. <d bf> |
  <ef g,>) \stemUp <d a>8-._( <c a>-. <d a>-. <bf f>-.) \stemNeutral <b fs>-.( <b e,>-. <c bf e,>-. <c a f>-. <d af>-.) |

  \barNumberCheck #13
  \grace { g,16( bf ef } g4) \stemDown a,16( bf \stemNeutral cf bf cs d g16. f32) f4 ef8\(~ 16 f ef\prall d ef f |
  g  b, c df( c) f( e) af( g) df'( c g bf!4.) af4 g8 |
  f4.\)\startTrillSpan \grace { e16\stopTrillSpan f } g8-. g( d) ef4.( c4.) |
  bf8( d') cs(-. \tuplet 13/6 { c16-. b-. bf-. a-. af-. f-. d-. cf->) bf d g f ef } ef4.~ 8 d ef |

  \barNumberCheck #17
  f4.( g4 ef8) f4.( c4.) |
  \tuplet 4/3 { ef8( 8 8 8 } ef d16 ef f16. ef32 ef4.) bf |
  bf'( a4 g8 <f a,>4. <d bf> |
  <ef g,>) \stemUp <d a>8-._( <c a>-. <d a>-. <bf f>-.) \stemNeutral <b fs>-.( <b e,>-. <c bf e,>-. <c a f>-. <d af>-.) |

  \barNumberCheck #21
  \grace { g,16(\( bf ef } g4) \stemDown a,16( bf \stemNeutral
  \once \override Script.avoid-slur = #'inside
  cf-> bf cs d
  \once \override Script.avoid-slur = #'inside
  g16.-> f32) f4 ef8~ 16 f
  \once \override Script.avoid-slur = #'inside
  ef\trill d ef f( |
  g)\) b, c df->( c) f->( e) af->( g) df'( c g \slashedGrace g8 bf!4.)
  af4 g8 |
  f4.\startTrillSpan \grace { e16\stopTrillSpan f } g8-! g( d) ef4.( c4.) |
  bf16( d'8 cs16.-. c16-. b32-. bf16-.[ a-.])
  af32-! a,( bf b
  \tuplet 3/2 { c cs d }
  \tuplet 3/2 { g f ef) }
  ef2. |

  \barNumberCheck #25
  ef4. f8( ef f g2.) |
  ef4.~ 16( g f) f( ef f g4)
  \once \override Script.avoid-slur = #'outside
  ef8\turn( ef')  d c |
  bf4 a8( af) c, d
  ef f16 ef\prall d ef
  \slashedGrace ef8^\shape #'((0 . -2.5) (-0.5 . 0) (0 . 0) (0 . 0)) (
  g'-.) f16-.( ef-. d-. c-. |
  cf8 bf bff) bff16( af) af( g) g16.( f32 ef2.) |

  \barNumberCheck #29
  ef4.~ \tuplet 8/6 { 16 f ef( f ef) f( ef f) } g4. r4 r8 |
  ef8-! af,16( bf
  \once \override Script.avoid-slur = #'inside
  af\trill g
  af[ cf ef af ef') r32 f]\( g8( ef)\)
  \ottava #1
  <ef' ef,>4 <d d,>8 <c! c,!> |
  <cf cf,> <bf bf,> <bff bff,> <af! af,!> <g g,> <d d,> <ef ef,>
  <ef ef'>4. <f f,>8 <c' c,> |

  \barNumberCheck #32
  <cf cf,>2. <bf bf,>2.\fermata |
  \magnifyMusic 0.63 {
  \cadenzaOn
  \stemUp
  \repeat unfold 12 { cf16[ bf c a] }
  cf16[ bf d c]
  bf[ a af g]
  f[( d ef c]
  \ottava #0
  bf8[ af af, bf])
  \stemNeutral
  \cadenzaOff
  }
  \resetRelativeOctave c''
  <ef g,>8( bf g' <ef g,> bf g' <ef g,> bf g' <ef g,> bf g') |
  <ef g,>4. <ef' g,> <ef,, g,>2.\fermata |
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

  \barNumberCheck #9

  bf,-. <f d'>( <bf d' f'>)
  bf,-. <f d'>( <bf d' f'>)
  a,-. <f c'>( <c' f'>)
  a,-. <f c'>( <c' f'>) |

  af,! <ef c'> <af c' ef'>
  af,, <ef cf'> <af cf' ef'>
  ef,-. <g ef'>( <bf ef' g'>)
  ef-.  <g ef'>( <bf ef' g'>) |

  e, <e df'> <bf df' g'>
  e, <e c'> <bf c' g'>
  f, <f ef'!> <c' ef' a'>
  g, <g d'> <bf d' bf'> |

  c, <g ef'> <c' ef' g'>
  f, <f ef'> <c' ef' f'>
  <bf d'> <a ds'> gs g <f! c' ef'> <bf f'> |

  \barNumberCheck #13
  ef, <g ef'> <bf ef' g'>
  ef <af d'> <bf d' af'>
  ef <g ef'> <bf ef' g'>
  d  <g ef'> <bf ef' g'> |

  c  <g e'> <bf e' g'>
  c  <g e'> <c' e' bf'>
  f, <f df'> <bf df' e'>
  f, <f c'> <af c' f'> |

  bf, <f d'!> <bf d' af'>
  b, <g f'> <d' f' g'>
  c <g ef'> <c' ef' g'>
  a, <gf ef'> <c' ef' gf'> |

  bf, <f ef'> <bf ef' af'>
  bf,, <f d'> <bf d' af'>
  ef,  <g ef'>  <bf  g'>
  ef  <g ef'>  <bf g'> |

  \barNumberCheck #17
  bf, <f d'> <bf d' f'>
  bf, <f d'> <bf d' f'>
  a, <f c'> <c' f'>
  a, <f c'> <c' f'> |

  af,! <ef c'> <af c' ef'>
  af,, <ef cf'> <af cf' ef'>
  ef, <g ef'> <bf ef' g'>
  ef  <g ef'> <bf ef' g'> |

  e, <e df'> <bf df' g'>
  e, <e c'> <bf c' g'>
  f, <f ef'!> <c' ef' a'>
  g, <g d'> <bf d' bf'> |

  c, <g ef'> <c' ef' g'>
  f, <f ef'> <c' ef' f'>
  <bf d'> <a ds'> gs g <f! c' ef'!> <bf f'> |

  \barNumberCheck #21
  ef,-. <g ef'>( <bf ef' g'>)
  ef -. <af d'>( <bf d' af'>)
  ef -. <g ef'>( <bf ef' g'>)
  d  ( <g ef'> <bf ef' g'>) |

  c-.  <g e'>( <bf e' g'>)
  c-.  <g e'>( <c' e' bf'>)
  f, <f df'> <bf df' e'>
  f, <f c'> <af c' f'> |

  bf, <f d'!> <bf d' af'>
  b, <g f'> <d' f' g'>
  c <g ef'> <c' ef' g'>
  a, <gf ef'> <c' ef' gf'> |

  bf, <f ef'> <bf ef' af'>
  bf,, <f d'> <bf d' af'>
  ef,  <g ef'>  <bf ef' g'>
  ef  <g ef'>  <bf ef' g'> |

  \barNumberCheck #25
  ef, <af cf' ef'> <cf' ef' af'>
  ef <af cf' ef'> <cf' ef' af'>
  ef,-. <g ef'>( <bf ef' g'>)
  ef-. <g ef'>( <bf ef' g'>) |

  ef, <af cf' ef'> <cf' ef' af'>
  ef <af cf' ef'> <cf' ef' af'>
  ef, <g bf ef'> <bf ef' g'>
  ef <g ef'> <bf ef' g'> |

  ef <f d'> <bf af'>
  ef <f d'> <bf af'>
  ef <g ef'> <bf g'>
  a, <f ef'> <c' ef' f'> |

  bf, <f ef'> <bf ef' af'>
  bf,, <f d'> <bf d' af'>
  ef, <g ef'> <bf ef' g'>
  ef <g ef'> <bf ef' g'> |

  \stemDown
  af,,-\shape #'((0 . 4) (3.5 . 5) (0 . -4) (0 . 0)) (
  <ef af cf'> <af cf' ef'>
  \stemNeutral
  <cf' ef' af'> <af cf' ef'> <ef af cf'>)
  ef, <g ef'> <bf ef' g'>
  ef <g ef'> <bf ef' g'> |

  af,, <ef af cf'> <af cf' ef'>
  <ef af cf'> <af cf' ef'> <ef af cf'>
  ef, <g ef'> <bf ef' g'>
  a, <f ef'> <c' ef' f'> |

  bf, <f bf ef'> <bf ef' af'>
  b, <g f'> <d' f' g'>
  c <g ef'> <c' g'>
  a,-!
  <<
    { <c' ef'>8 <c' ef' f'> } \\
    f4
  >> |

  \barNumberCheck #32
  \stemDown
  \tuplet 4/3 {
    bf,,8[
    -\shape #'((0 . 2) (0 . 0) (0 . 0) (0 . 1)) -(
    bf, f af
  }
  \tuplet 4/3 {
    d' bf
    \clef treble
    f' af'])
  }
  \stemNeutral
  d''2.\fermata
  \cadenzaOn
  s4*10
  s4*7
  \cadenzaOff
  |

  \clef bass
  \barNumberCheck #33
  <<
    { s8 bf4 s8 bf4 s8 bf4 s8 bf4~ | \stemDown bf4. } \\
    { ef,8^( bf bf, ef bf bf,)
      ef,8^( bf bf, ef bf bf, |
      ef4.) }
  >>
  \clef treble
  <ef' bf'>4.
  \clef bass
  <ef, bf,>2._\fermata |
}

above = {
  s8 |
  s1.*11 |
  \barNumberCheck #12
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4. s8 s s s s\< s s s s\! |
  \grace { s16^\markup \italic { a tempo } s s } s1. |
  s1.*6 |

  \barNumberCheck #20
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4. s8 s s s s\< s s s s\! |

  \barNumberCheck #21
  \grace { s16^\markup \italic { a tempo } s s } s1. |
  s1.*2 |
  s2. \long_accent_above s8-\tweak extra-offset #'(0 . -1) \> s8\! s8 s4. |

  \barNumberCheck #25
  s1.*7 |

  \barNumberCheck #32
  s1.
  \cadenzaOn
  s4*10
  s4*7
  \cadenzaOff

  \barNumberCheck #33
  s8^\markup \italic { a tempo }
}

between = {
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
  s1.*2 |

  \barNumberCheck #9
  s4.^\p \long_accent_below s8\> s8\! s8 s4.^\pp s4. |
  s8-\markup \italic { poco rit. } s4 s4. s2. |

  \barNumberCheck #11
  s4.^\tweak extra-offset #'(-1 . 0) \f-\markup \italic { a tempo }
  s4. s2. |
  s4. s4. s8 \long_accent_below s8\>_\markup \italic { poco rallent. } s8\! s4. |

  \barNumberCheck #13
  \grace { s16 s s }
  s4-\fzp s8 s4. s2. |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s16\< s s s s s\! s16^\markup \italic { cresc. } s s s s s s4
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  \once \override Hairpin.shorten-pair = #'(2 . 0)
  s8\> s4 s8\! |
  s4.^\p s8
  \long_accent_below
  \once \override Hairpin.shorten-pair = #'(0 . -1)
  s8\> s8\!
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,CENTER)
  s4.\< s8 s8\! s8 |
  s1. |

  \barNumberCheck #17
  s1. |
  s2. s4. s4\< s8\! |
  s4.\f s4.
  \once \override Hairpin.endpoint-alignments = #`(,CENTER . ,LEFT)
  \once \override Hairpin.shorten-pair = #'(0 . 0.5)
  s4.\> s4.\! |
  s4. s4. s4.^\markup \italic { poco rall. } s4. |

  \barNumberCheck #21
  \grace { s16 s s }
  s4^\tweak extra-offset #'(0 . 2) \fzp s8 s4. \long_accent_below
  s8-\tweak extra-offset #'(0 . 3) \> s8\! s8
  s16-\tweak extra-offset #'(0 . 2) \< s s s s s\! |

  s4.
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4.\< s4.\! s4. |
  s1. |

  s16 s8
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s16.\> s16 s32 s16 s
  s32 s s s
  \tuplet 3/2 { s s s }
  \tuplet 3/2 { s s s\! }
  s2. |

  \barNumberCheck #25
  s8^\tweak extra-offset #'(0 . 1) \p s4 s4. s2. |
  s8^\pp s4 s4. s8^\markup \italic { poco rubato } s4 s4. |
  s8^\markup { \italic { sempre } \dynamic { pp } }
  s4 s4. s4. \grace { s8^\markup\italic { dolciss. } } s4. |
  s4. s4. \long_accent_below s8-\tweak extra-offset #'(0 . 0.5) \> s8\! s8 s4. |

  \barNumberCheck #29
  s4.\p \tuplet 8/6 { s16 s s s s s
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s\< s } s4.\! s4. |
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

below = {
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
  \ped_double \ped_double |
  \ped_double \ped_double |
  \ped_single \ped_single \ped_single \ped_single |
  \ped_single \ped_single s2. |

  \barNumberCheck #13
  \ped_single s4. s2. |

  s1.*11 |
  \barNumberCheck #25
  \ped_double \ped_double |
  \ped_double \ped_double |
  \ped_double \ped_single \ped_single |
  \ped_single \ped_single \ped_double |
  \ped_double \ped_double |
  \ped_double \ped_single \ped_single |
  \ped_single \ped_single \ped_single \ped_single |

  \barNumberCheck #32
  s8\sustainOn s4 s4. s4. s8 s8 s8
  \cadenzaOn
  s4*10
  s4*5
  s8\sustainOff s8 s4
  \cadenzaOff

  s8\sustainOn
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
  \grace { s16 s s }
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
  s1.*2 |
  \break \barNumberCheck #32
  s2. s2.
  \cadenzaOn
  s4*10 \break
  s4*7
  \cadenzaOff
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
