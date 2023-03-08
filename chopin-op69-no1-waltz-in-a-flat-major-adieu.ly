\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  markup-system-spacing = #0
  top-margin = #4
  bottom-margin = #4
}

\header {
  title = "Waltz no. 9 [“L’adieu”]"
  subsubtitle = \markup { dedicated to Elise Peruzzi (1837) }
  composer = "Frédéric Chopin"
  opus = "WN 47 (1835) [Op. posth. 69, No. 1]"
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
  }

  \context {
    \PianoStaff
    \accidentalStyle piano
  }
}

global = {
  \key af \major
  \time 3/4
  \tempo "Tempo di Valse"
  \partial 4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 1-(16), 1-beat anacrusis, simple repeat before last
%%                 beat of m. 16, fine
%%
%% A = mm. 25-(40), no anacrusis, no repeat, section break before last
%%                  beat of m. 40
%%
%% All the same notation both times.

upper.A_anacrusis = \relative {
  \clef treble
  ef''8( d |
}

upper.A = \relative {
  \tuplet 3/2 { df'' ef df } c[ df f8. ef16] |
  df2 c4) |
  r4
  a8( bf \tuplet 3/2 { c ef df } |
  c2 bf4) |
  bf4.(-> af8 \tuplet 3/2 { af g f } |
  f2 ef4) |
  ef\( \grace { ef8[ f ef d ef] }
  \once \slurUp
  \acciaccatura ef8 g' f ef df |
  b2 c4~\) |
  8( df bf') af( f df |
  df2 c4) |
  r8
  \once \omit TupletNumber
  \tiny
  \tuplet 13/3 { a8(-> bf a gs a bf b c df d ef e f }
  \normalsize
  gf-.[) r16 a,!16](
  |
  \slashedGrace a8 c2 bf4) |
  bf4.( af8 \tuplet 3/2 { af g f } |
  f2 ef4) |
  \slashedGrace ef8
  \tuplet 3/2 { ef8( f ef } d ef <f df'> <g c> |
  af2)
}

lower.A_anacrusis = \relative {
  \clef bass
  r4
}

lower.A_tenor = \relative {
  r4 <af df> q |
  r <g df'> <g c> |
  r <gf c> q |
  r <f c'> <f bf> |
  r <f bf> <f b> |
  s2.*3 |
  r4 <af df> q |
  r <g df'> <g c> |
  r <gf c> q |
  r <f c'> <f bf> |
  r <f bf> <f b> |
  s2.*2 |
  s2
}

lower.A_bass = \relative {
  f2. |
  e |
  ef |
  df |
  d |
  \oneVoice
  ef,4 <ef' af c> q |
  ef,4 <ef' g df'> q |
  af, <ef' af c> <e af c> |
  \voiceTwo
  f2. |
  e |
  ef |
  df |
  d |
  \oneVoice
  ef,4 <ef' af c> q |
  ef, <ef' g df'!> <ef bf' df> |
  af,( <ef' c'>)
  \voiceTwo
}

lower.A = {
  \clef bass
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.A_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.A_bass
    }
  >>
}

editorial.above.A_anacrusis = {
  s4 |
}

editorial.above.A = {
  s2. |
  s2 s4 |
  \barNumberCheck #3
  %% The trick to footnotes in the Dynamics context is to attach the
  %% footnote to an event that's attached to a spacer rest. We want an
  %% event that doesn't actually have any visual effect, so we use an
  %% empty text event. The general idea is
  %%
  %%   s4-\footnote mark offset-pair content
  %%     ^""
  %%
  %% Another way to do it is a timing footnote on Staff.BarLine. That
  %% will put the mark directly above the barline, and if there's a line
  %% break the bar line is on the line before. That looks like
  %%
  %%   \footnote mark offset-pair content Staff.BarLine
  %%
  s4-\footnote
       ✱
       #'(0 . 0)
       \markup {
         \tiny { ✱ \italic { m. 3: } \hspace #1 }
         \score {
           \new Staff \with {
             \magnifyStaff #1/2
             \remove Time_signature_engraver
             \override KeySignature.stencil = ##f
           }
           \relative {
             \clef treble
             \key af \major
             \override NoteHead.font-size = #2
             \override Accidental.font-size = #2
             \override Rest.font-size = #2
             r4 a'8[( bf c \slashedGrace ef df])
             \revert NoteHead.font-size
             \revert Accidental.font-size
             \revert Rest.font-size
             \bar "|"
           }
         }
         \tiny { \hspace #1 [A3] (Rothschild’s autograph, 1842); [EF] (Fontana’s editions, 1855) before trio, \italic "da capo" }
       }
     ^""
  s2 |
  s2.*7 |
  \barNumberCheck #11
  s8-\footnote
       ✱
       #'(0 . 0)
       \markup {
         \tiny { ✱ \italic { m. 11: } }
         \score {
           \new Staff \with {
             \magnifyStaff #1/2
             \remove Time_signature_engraver
             \override KeySignature.stencil = ##f
           }
           \relative {
             \override NoteHead.font-size = #2
             \override Accidental.font-size = #2
             \override Rest.font-size = #2
             \clef treble
             \key af \major
             \stemUp
             r8
             \once \omit TupletNumber
             \once \slurDown
             \tuplet 8/6 { a'16[( bf a gs a-. c-. ef-. f-.]) }
             \stemNeutral
             gf8-!
             r16 a,
             \revert NoteHead.font-size
             \revert Accidental.font-size
             \revert Rest.font-size
             \bar "|"
           }
         }
         \tiny { \hspace #0.5 [A1] (Wodzińska’s autograph, 1835); \hspace #0.5 }
         \score {
           \new Staff \with {
             \magnifyStaff #1/2
             \remove Time_signature_engraver
             \override KeySignature.stencil = ##f
           }
           \relative {
             \clef treble
             \key af \major
             \once \omit TupletNumber
             \stemUp
             \once \slurDown
             \tuplet 12/4 { a'8[( bf a gs a c ef gf
                                 \ottava #1
                                 a c ef f]
                          }
             \stemNeutral
             \override NoteHead.font-size = #2
             \override Accidental.font-size = #2
             \override Rest.font-size = #2
             gf8-![)
               \ottava #0
               r16 a,,!]
             \revert NoteHead.font-size
             \revert Accidental.font-size
             \revert Rest.font-size
             \bar "|"
           }
         }
         \tiny { \hspace #0.5 [EF] \italic "de capo" }
       }
     ^""
  s8 s2 |
  s2.*3 |
  \barNumberCheck #15
  \grace
  s8-\footnote ✱ #'(0 . 0) \markup { \tiny { ✱ \italic { m. 15: } [NE] (Chopin National Edition, Vol. 27 B III, Ekier et al., 2010) advises playing this grace note before the beat. } }
    ^""
  s2. |
  s2
  \barNumberCheck #16
}

editorial.above.A_repeat = {
  s2.*8 |
  \barNumberCheck #33
  s8-\footnote
       ✱
       #'(0 . 0)
       \markup {
         \tiny { ✱ \italic { m. 33: } \hspace #1 }
         \score {
           \new Staff \with {
             \magnifyStaff #1/2
             \remove Time_signature_engraver
             \override KeySignature.stencil = ##f
           }
           \relative {
             \clef treble
             \key af \major
             \override NoteHead.font-size = #2
             \override Accidental.font-size = #2
             \override Rest.font-size = #2
             c''8([ df \slashedGrace df bf') af( f df)]
             \revert NoteHead.font-size
             \revert Accidental.font-size
             \revert Rest.font-size
             \bar "|"
           }
         }
         \tiny { \hspace #1 [EF] \italic "da capo" (m. 9). [NE] suggests as optional variant here at m. 33.  }
       }
    ^""
  s8 s2 |
  s2.*6 |
  s2
}

editorial.between.A_anacrusis = {
  s4-\tweak thickness #3.5
    _\markup \whiteout \italic "con anima"
  |
}

editorial.between.A = {
  s4
  \once \override Hairpin.shorten-pair = #'(0 . -2)
  s4\< s4 |
  s2\> s4\! |
  s2.*3 |
  s8..\> s32\! s4 s4 |
  s2.*3 |
  s8..\> s32\! s4 s4 |
  s2.*3 |
  s4\> s4\! s4 |
  s2. |
  s2
}

editorial.below.A_anacrusis = {
  s4 |
}

editorial.below.A = {
  s2.*5 |
  s4\sustainOn s4 s8 s8\sustainOff |
  s4\sustainOn s4 s8 s8\sustainOff |
  s4\sustainOn s8 s8\sustainOff s4 |
  s2.*5 |
  s4\sustainOn s4 s8 s8\sustainOff |
  s4\sustainOn s4 s8 s8\sustainOff |
  s4\sustainOn s8 s8\sustainOff
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. (16)-24b, 1-beat anacrusis, two 1-measure voltas

upper.B_anacrusis = \relative {
  c''8( cf |
}

upper.B = \relative {
  \barNumberCheck #17
  \tuplet 3/2 { bf'8 c bf } a bf bf bf' |
  c[) r16 bf16( g8 ef] bf4) |
  \repeat unfold 2 {
    \tuplet 3/2 { bf8( c bf } a bf bf bf' |
    c[) r16 bf16( g8 ef] bf4) |
  }
  \tuplet 3/2 { bf8( c bf } a bf af' g) |
}

upper.B_volta.1 = \relative {
  f''4( ef8 g,[ af a])
}

upper.B_volta.2 = \relative {
  f''4.( e8 ef d) |
}

lower.B_anacrusis = \relative {
  r4 |
}

lower.B_tenor = \relative {
  f'4( g d |
  ef4. bf8 4) |
  d4.(\arpeggio bf8 4) |
  ef4.( bf8 4) |
  f'4( g d |
  ef4. bf8 4) |
}

lower.B_bass = \relative {
  \clef treble
  <af bf>2. |
  g |
  \clef bass
  \once \set PianoStaff.connectArpeggios = ##t
  <af bf,>\arpeggio |
  <ef g>4 s2 |
  \clef treble
  <af bf>2. |
  g |
  \clef bass
  \oneVoice
  bf,4-. <af'! d>( bf) |
}

lower.B = {
  \barNumberCheck #17
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.B_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.B_bass
    }
  >>
}

lower.B_volta.1 = \relative {
  ef4-. <g ef'>( bf) |
}

lower.B_volta.2 = \relative {
  ef4( <g ef'> bf) |
}

editorial.above.B_anacrusis = {
  s4 |
}

editorial.above.B = {
  \barNumberCheck #17
  s2.*7 |
}

editorial.above.B_volta.1 = {
  s2. |
}

editorial.above.B_volta.2 = {
  s2. |
}

editorial.between.B_anacrusis = {
  s4 |
}

editorial.between.B = {
  \barNumberCheck #17
  s2.*7 |
}

editorial.between.B_volta.1 = {
  s4\> s4\! s4 |
}

editorial.between.B_volta.2 = {
  s4\> s4\! s4 |
}

editorial.below.B_anacrusis = {
  s4 |
}

editorial.below.B = {
  \barNumberCheck #17
  s2.*2 |
  s4\sustainOn s4 s8 s8\sustainOff |
  s2.*3 |
  s4\sustainOn s4 s8 s8\sustainOff |
}

editorial.below.B_volta.1 = {
  s4\sustainOn s4 s8 s8\sustainOff |
}

editorial.below.B_volta.2 = {
  s2. |
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% trio.A = mm. (40)-(48b), 1-beat anacrusis, volta 1 is full measure,
%%                          section break before last beat of volta 2

upper.trio.A_anacrusis = \relative {
  <df'' f>4-. |
}

upper.trio.A_split = {
  <<
    \context Voice = "soprano" \relative {
      \voiceOne
      \once \hideNotes
      f'4(
      \tuplet 3/2 { f8 g f } |
      \once \hideNotes
      ef4)
    }
    \context Voice = "alto" \relative {
      \voiceTwo
      df'2-> |
      <c ef>4^.
    }
  >>
}

upper.trio.A = \relative {
  <bf' df>4-. \upper.trio.A_split <af c>4-.( <bf df-.> |
  <g bf>-.) \upper.trio.A_split <af c>4-.( <df f>-. |
  <bf df>-.) \upper.trio.A_split <af c>4-.( <bf df-.> |
  <g bf>-.)
  <<
    \context Voice = "soprano" \relative {
      \voiceOne
      \once \hideNotes
      f'4(
      \tuplet 3/2 { f8 g f } |
    }
    \context Voice = "alto" \relative {
      \voiceTwo
      df'2-> |
    }
  >>
}

upper.trio.A_volta.1 = \relative {
  <<
    \context Voice = "soprano" \relative {
      \once \hideNotes
      ef'2)
    }
    \context Voice = "alto" \relative {
      \voiceTwo
      \once \stemUp
      <c' ef>2
    }
  >>
  <df'' f>4-.
}

upper.trio.A_volta.2 = \relative {
  \once \hideNotes
  \grace ef''8^(
  <c, ef af>2)
}

upper.trio.A_last_bar = \relative {
  \context Voice = "soprano" {
    <c' ef af>2)
  }
}

lower.trio.A_anacrusis = \relative {
  r4
}

lower.trio.A_core = \relative {
  ef,4-. g'( ef) |
  af,-. af'( ef) |
  ef,4-. bf''( ef,) |
  af,-. af'( ef) |
  ef,4-. g'( ef) |
  af,-. af'( ef) |
}

lower.trio.A = \relative {
  \lower.trio.A_core
  ef,4-. bf''(
  \shape #'((3.75 . 0) (4.5 . 0) (4.5 . 0) (5.25 . 0)) RepeatTie
  ef,)-\parenthesize-\repeatTie
}

lower.trio.A_repeat = \relative {
  \lower.trio.A_core
  \context Voice = "tenor" {
    \oneVoice
    ef,4-. bf''( ef,)~
  }
}

lower.trio.A_volta.1 = \relative {
  af,-. af'( ef) |
}

lower.trio.A_volta.2 = \relative {
  <<
    \context Voice = "tenor" \relative {
      \voiceOne
      ef4\repeatTie af
    }
    \context Voice = "bass" \relative {
      \voiceTwo
      <ef af,>2
    }
  >>
}

lower.trio.A_last_bar = \relative {
  <<
    \context Voice = "tenor" \relative {
      \voiceOne
      ef4 af
    }
    \context Voice = "bass" \relative {
      \voiceTwo
      <ef af,>2
    }
  >>
}

editorial.above.trio.A_anacrusis = {
  s4
}

editorial.above.trio.A = {
  s2.*7 |
}

editorial.above.trio.A_volta.1 = {
  s2. |
}

editorial.above.trio.A_volta.2 = {
  s4 s4
}

editorial.between.trio.A_anacrusis = {
  s4\p
}

editorial.between.trio.A_anacrusis_repeat = {
  s4
}

editorial.between.trio.A = {
  s2.*7 |
}

editorial.between.trio.A_volta.1 = {
  s2. |
}

editorial.between.trio.A_volta.2 = {
  s4 s4
}

editorial.below.trio.A_anacrusis = {
  s4
}

editorial.below.trio.A = {
  s2\sustainOn s16*3 s16\sustainOff |
  \repeat unfold 3 {
    s4\sustainOn s4\sustainOff s4 |
    s2\sustainOn s16*3 s16\sustainOff |
  }
}

editorial.below.trio.A_volta.1 = {
  s4\sustainOn s16*3 s16\sustainOff s4 |
}

editorial.below.trio.A_volta.2 = {
  s4 s4
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% trio.B = (48b)-(56), 1 beat anacrusis,
%%                      fermata before last beat of 56

upper.trio.B_anacrusis = \relative {
  <<
    \context Voice = "soprano" \relative {
      \voiceOne
      c''4 |
    }
    \context Voice = "alto" \relative {
      \voiceTwo
      e'4 |
    }
  >>
}

upper.trio.B = {
  \barNumberCheck #49
  <<
    \context Voice = "soprano" \relative {
      \voiceOne
      c''4( b8 c df4) |
      df4( c8 df d4) |
      d4( cs8 d ef4) |
      ef4( d8 ef e4) |
      e4( ds8 e f4) |
      f4( e8 f g4) |
      g4( fs8 g af4) |
    }
    \context Voice = "alto" \relative {
      \voiceTwo
      e'2 f4 |
      2 af4 |
      2 g4 |
      2 bf4 |
      2 af4 |
      2 df4 |
      2 c4 |
    }
  >>
  \relative {
    <df'' bf'>2\fermata
  }
}

lower.trio.B_anacrusis = \relative {
  <c g'>4 |
}

lower.trio.B = \relative {
  \barNumberCheck #49
  <c g'>2 <cf af'>4 |
  q2 <bf bf'>4 |
  q2 <ef bf'>4 |
  q2 <c c'>4 |
  q2 <f c'>4 |
  q2 <ef ef'>4 |
  q2 <af ef'>4 |
  <g ef'>2_\fermata
}

editorial.above.trio.B_anacrusis = {
  s4 |
}

editorial.above.trio.B = {
  \barNumberCheck #49
  s2.*7 |
  s4 s4
}

editorial.between.trio.B_anacrusis = {
  s4 |
}

editorial.between.trio.B = {
  \barNumberCheck #49
  s4 s4\cresc s4 |
  s2.*5 |
  s4\! s4 s4 |
  s4 s4
}

editorial.below.trio.B_anacrusis = {
  s4 |
}

editorial.below.trio.B = {
  \barNumberCheck #49
  s2.*7 |
  s4 s4
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% breaks_ref to match FWN 7a

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s4 |
  s2.*4 | \break
  \barNumberCheck #5
  s2.*6 | \break
  \barNumberCheck #11
  s2.*5 |
  \barNumberCheck #16
  s2 \break
  s4 |
  s2.*5 | \break
  \barNumberCheck #22
  s2.*6 | \pageBreak % volta in here 24a/24b
  \barNumberCheck #27
  s2.*6 | \break
  \barNumberCheck #33
  s2.*6 | \break
  \barNumberCheck #39
  \grace s8
  s2.*6 | \break
  \barNumberCheck #45
  s2.*7 | \break % volta in here 48a/48b
  \barNumberCheck #51
  s2.*7 | \break
  \barNumberCheck #58
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

%%showLastLength =   % use this to only render the last few measures
\score {
  \new PianoStaff <<
    \new Dynamics \with {
      staff-affinity = #'DOWN
    }{
      \global
      \editorial.above.A_anacrusis
      \editorial.above.A
      \editorial.above.B_anacrusis
      \editorial.above.B
      \editorial.above.B_volta.1
      \editorial.above.B_volta.2
      \editorial.above.A_repeat
      \editorial.above.trio.A_anacrusis
      \editorial.above.trio.A
      \editorial.above.trio.A_volta.1
      \editorial.above.trio.A_volta.2
      \editorial.above.trio.B_anacrusis
      \editorial.above.trio.B
      \editorial.above.trio.A_anacrusis
      \editorial.above.trio.A
      \editorial.above.trio.A_volta.2
    }
    \new Staff = "up" {
      \global
      \repeat segno 2 {
        \repeat volta 2 {
          \upper.A_anacrusis
          \upper.A
        }
        \fine
        \upper.B_anacrusis
        \repeat volta 2 {
          \upper.B
        }
        \alternative {
          \upper.B_volta.1
          \upper.B_volta.2
        }
        <<
          %% At the top, the slur starts in the anacrusis. In this
          %% written out repeat of A, the slur starts on the first note
          %% of the triplet, which we can accomplish by creating an
          %% equivalent parallel spacer rest to start the slur.
          { \tuplet 3/2 { s8( s8 s8 } }
          \upper.A
        >>
        \section \sectionLabel "TRIO"
        \upper.trio.A_anacrusis
        \repeat volta 2 {
          \upper.trio.A
        }
        \alternative {
          \upper.trio.A_volta.1
          \upper.trio.A_volta.2
        }
        \section
        \upper.trio.B_anacrusis
        \upper.trio.B
        \upper.trio.A_anacrusis
        \upper.trio.A
        \upper.trio.A_last_bar
        \bar "||"
      }
    }
    \new Dynamics \with {
      staff-affinity = #'CENTER
    }{
      \global
      \editorial.between.A_anacrusis
      \editorial.between.A
      \editorial.between.B_anacrusis
      \editorial.between.B
      \editorial.between.B_volta.1
      \editorial.between.B_volta.2
      \editorial.between.A
      \editorial.between.trio.A_anacrusis
      \editorial.between.trio.A
      \editorial.between.trio.A_volta.1
      \editorial.between.trio.A_volta.2
      \editorial.between.trio.B_anacrusis
      \editorial.between.trio.B
      \editorial.between.trio.A_anacrusis_repeat
      \editorial.between.trio.A
      \editorial.between.trio.A_volta.2
    }
    \new Staff = "down" {
      \global
      \lower.A_anacrusis
      \lower.A
      \lower.B_anacrusis
      \lower.B
      \lower.B_volta.1
      \lower.B_volta.2
      \lower.A
      \section
      \lower.trio.A_anacrusis
      \lower.trio.A
      \lower.trio.A_volta.1
      \lower.trio.A_volta.2
      \section
      \lower.trio.B_anacrusis
      \lower.trio.B
      \lower.trio.A_anacrusis
      \lower.trio.A_repeat
      \lower.trio.A_last_bar
    }
    \new Dynamics \with {
      staff-affinity = #'UP
    }{
      \global
      \editorial.below.A_anacrusis
      \editorial.below.A
      \editorial.below.B_anacrusis
      \editorial.below.B
      \editorial.below.B_volta.1
      \editorial.below.B_volta.2
      \editorial.below.A
      \editorial.below.trio.A_anacrusis
      \editorial.below.trio.A
      \editorial.below.trio.A_volta.1
      \editorial.below.trio.A_volta.2
      \editorial.below.trio.B_anacrusis
      \editorial.below.trio.B
      \editorial.below.trio.A_anacrusis
      \editorial.below.trio.A
      \editorial.below.trio.A_volta.2
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
