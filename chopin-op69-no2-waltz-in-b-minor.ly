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
  title = "Waltz"
  composer = "Frédéric Chopin"
  opus = "WN 19 (1829) [Op. posth. 69, No. 2]"
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
    printKeyCancellation = ##f
  }
}

global = {
  \key b \minor
  \time 3/4
  \partial 4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 1-16b, 1-beat anacrusis, two 1-measure voltas

upper.A_anacrusis = \relative {
  \clef treble
  fs''4~ |
}

upper.A = \relative {
  fs''8( g fs cs d b) |
  as2 fs'4~ |
  8( g fs cs e d) |
  b2 fs'4~ |
  8( g es fs b d) |
  d4 es, d'->~ |
  4 e, cs'->~ |
  8( b as g fs e) |
  d8( g fs cs d b) |
  as2 fs'4~ |
  8( g fs cs e d) |
  b2 fs'4 |
  \slashedGrace { \bar "" \once \slurUp fs8-\shape #'((0 . 1) (0 . 0.5) (0 . 0.5) (0.5 . 0))^( \bar "|" }
  fs'8[) r16 cs\( d8 as b fs] |
  a g b, c ds e |
  g8.[ fs16 b,8 d cs fs,] |
}

upper.A_volta.1 = \relative {
  \stemDown
  b'8\) es,( fs as b d) |
  \stemNeutral
}

upper.A_volta.2 = \relative {
  \once \hideNotes
  \grace { \once \stemUp e''1-\shape #'((-1 . 0) (-0.5 . 0) (0 . 0) (0 . 0))^( }
  b4.) fs8[ b r16 bf] |
}

lower.A_anacrusis = \relative {
  \clef bass
  r4 |
}

lower.A = \relative {
  b,4 <fs' b d> q |
  cs <fs cs' e> q |
  as, <fs' cs' e> q |
  b,4 <fs' b d> q |
  b,4 <fs' b d> q |
  b,4 <gs' b d> q |
  b,4 <g' b e> q |
  b,4 <fs' cs' e> <fs as e'> |
  b,4 <fs' b d> q |
  cs <fs cs' e> q |
  fs, <fs' as e'> q |
  b, <fs' b d> r |
  <d d,> <fs b fs'> r |
  <e e,> <g c> q |
  fs, <fs' b d> <fs as e'> |
}

lower.A_volta.1 = \relative {
  <b d>4 b, r |
}

lower.A_volta.2 = \relative {
  b, <fs' d'>8 r d4 |
}

editorial.above.A_anacrusis = {
  \long_accent_above
  s8..-\footnote
       ""
       #'(0 . 0)
       \markup \tiny \wordwrap {
         ✱ Musical text from the copy by an unknown copyist at Bibliothèque Nationale, Paris.
       }
    \> s32\! |
}

editorial.above.A = {
  s2. |
  s2 \long_accent_above s8..\> s32\! |
  s2. |
  s2 \long_accent_above s8..\> s32\! |
  s2.*5 |
  s2 \long_accent_above s8..\> s32\! |
  s2.*4
  \long_accent_above s8.\> s16\! s2 |
}

editorial.above.A_volta.1 = {
  s2. |
}

editorial.above.A_volta.2 = {
  s2. |
}

editorial.between.A_anacrusis = {
  s4 |
}

editorial.between.A = {
  \repeat unfold 15 s2. |
}

editorial.between.A_volta.1 = {
  R2. |
}

editorial.between.A_volta.2 = {
  R2. |
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. 17-32

upper.B = \relative {
  \barNumberCheck #17
  bf'4.->( a8 cs e) |
  g4.->( fs8 cs d) |
  fs4.->( e8 b cs) |
  e4.->( d8[ \slashedGrace d cs8. b16]) |
  b4.->( a8 cs e) |
  g4.->( fs8 cs d) |
  fs4.-> e8 b cs |
  as4.^> cs8 g cs |
  fs,4.\( as8 cs e |
  g4. fs8 cs d\) |
  \slashedGrace d8 fs4.( e8 b cs) |
  \slashedGrace cs8 e4.( d8 \tuplet 3/2 { d cs b) } |
  b4.->( a8 cs e) |
  g4.( fs8 cs d) |
  fs4. e8-\shape #'((0 . -1.5) (0 . 0) (0 . 0) (0 . 0))-( fs'-.) e( |
  d) cs-. c-. b-. as-. a-. |
}

lower.B = \relative {
  \barNumberCheck #17
  cs4 <g' a e'> q |
  d <fs a d> q |
  a, <a' cs g'> q |
  d, <a' d fs> q |
  cs, <g' a e'> q |
  d <fs a d> r |
  g, <e' b' e> r |
  fs, <fs' cs' e> <fs b e> |
  fs, <fs' cs' e> <fs as e'> |
  b, <fs' b d> q |
  a, <a' cs g'> q |
  d, <a' d fs> q |
  cs, <g' a e'> q |
  d < fs a d> r |
  g, <e' b' e> r |
  fs,-. <fs' e'> as,( |
}

editorial.above.B = {
  \barNumberCheck #17
  s2.*9 |
  \long_accent_above s8..\> s32\! s2 |
  \long_accent_above s8..\> s32\! s2 |
  \long_accent_above s8..\> s32\! s2 |
  s2.*4 |
}

editorial.between.B = {
  \barNumberCheck #17
  s2.*15 |
  s8^\markup { \italic stretto } s8 s4 s4 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A′ = mm. 33-48

upper.A′ = \relative {
  \barNumberCheck #33
  gs''8-. g-. fs-. cs-. d-. b-. |
  as2 a'4 |
  gs8-.( g-. fs-. e-. cs-. d-.) |
  b4 r a' |
  gs8( g es fs b d) |
  d4 es, d'->~ |
  4 e, cs'-> |
  c8-. b-. as-. a-. gs-. g-. |
  fs-. f-. e-. d-. cs-. b-. |
  as2 g'4~ |
  8 fs es fs cs d |
  b2 fs'4\turn |
  \slashedGrace { \bar "" fs8 \bar "|" }
  fs'8 cs( d) as( b) fs\( |
  a g b, c ds e\) |
  g\( fs b, d cs fs, |
  \section
  \key b \major
  b4\) r fs |
}

lower.A′ = \relative {
  \barNumberCheck #33
  b,4) <fs' b d> q |
  cs <fs cs' e> q |
  fs, <fs' as e'> q |
  b, <fs' b d> q |
  b, <fs' b d> q |
  b, <gs' b d> q |
  b, <g' b e> q |
  b, <fs' cs' e> <fs as e'> |
  b, <fs' b d> q |
  cs <fs cs' e> q |
  fs, <fs' as e'> q |
  b, <fs' b d> r |
  <d d,> <fs b fs'> r |
  <<
    { \voiceTwo \once \stemUp \slashedGrace e,8 e'2. } \\
    { \voiceOne s4 <g c> q }
  >> |
  <fs fs,> <fs b d> <fs as e'> |

  \section
  \key b \major
  b, <fs' ds'> q |
}

editorial.above.A′ = {
  \barNumberCheck #33
  s2. |
  s2 \long_accent_above s8..\> s32\! |
  s2. |
  s2 \long_accent_above s8..\> s32\! |
  s2.*5 |
  s2 \long_accent_above s8..\> s32\! |
  s2.*6 |
}

editorial.between.A′ = {
  \barNumberCheck #33
  s2. |
  s2 s4^\fz |
  s2. |
  s2 s4^\fz |
  s2.*9 |
  \long_accent_below
  s8\> s8\!
  s8\< s8 s8 s8\! |
  s2.*2 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C = mm. 49-64

upper.C = \relative {
  \barNumberCheck #49
  ds''8( e ds cs ds e) |
  gs2( fs4) |
  ds8( e ds cs ds e) |
  gs2( fs4) |
  fs ds'8-.( 8-.) 4( |
  cs-.) e,8-.( 8-.) 4( |
  ds-.) b'8-.( 8-.) 4( |
  as-.) cs,8-.( 8-.) e4( |
  ds8)( e ds cs ds e) |
  \slashedGrace e8 gs2( fs4) |
  ds8( e ds cs ds e) |
  \slashedGrace e8 gs2( fs4) |
  ds b'8-.( 8-.) 4( |
  as-.) cs,8-.( 8-.) 4( |
  b-.) gs'8-.( 8-.) 4( |
  fs-.) \stemDown as,8-.( 8-.) \stemNeutral <as e'>4( |
}

lower.C = \relative {
  \barNumberCheck #49
  b,4 <fs' ds'> q |
  as, <fs' e'> q |
  b, <fs' ds'> q |
  as, <fs' e'> q |
  b, <fs' b ds> q |
  fs, <fs' as e'> q |
  b, <fs' b ds> q |
  fs, <fs' cs' e> <fs as e'> |
  b, <fs' b ds> q |
  as, <fs' cs' e> q |
  b, <fs' b ds> q |
  as, <fs' cs' e> q |
  b, <fs' b ds> q |
  cs <as' cs fs> q |
  cs, <gs' cs es> q |
  fs, <fs' cs' e> q |
}

editorial.above.C = {
  \barNumberCheck #49
  s8-\markup { \italic dolce } s8 s2 |
  s2.*15 |
}

editorial.between.C = {
  \barNumberCheck #49
  s2.*16 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C′ = mm. 65-80

upper.C′ = \relative {
  \barNumberCheck #65
  <b' ds>8)( <cs e> <b ds> <as cs> <b ds> <cs e> |
  <as gs'>4) r8 <e' fs> q4-> |
  <b ds>8( <cs e> <b ds>\prall <as cs> <b ds> <cs e> |
  <as gs'>4) r8 <e' fs> q4-> |
  <ds fs>4 <fs ds'>8-.( q-.) q4( |
  <e cs'>4-.) <e as,>8-.( q-.) q4( |
  <ds b>4-.) <ds b'>8-.( q-.) q4( |
  <cs as'>4-.) <cs as>8-.( q-.) <e as,>4( |
  <b ds>8)( <cs e> <b ds> <as cs> <b ds> <cs e> |
  <as g'>4) r8 <e' fs> q4-> |
  <b d>8( <cs e> <b d>\prall <as cs> <b d> <cs e> |
  <as g'>4) r8 <as fs'>( q4-> |
  <b fs'>4. <e fs,>8 <d b>4) |
  <d es,>4.^( <cs es,>8 <b es,>4) |
  <as fs>4-\shape #'((0 . 2) (0 . 1) (0 . 1) (0 . 0.5))-( <cs as>2~ |
  q4) fs, fs'~ |
}

lower.C′ = \relative {
  \barNumberCheck #65
  \repeat unfold 5 {
    b,4 <fs' b ds> q |
    fs, <fs' cs' e> q |
  }
  b, <fs' b d> q |
  fs, <fs' cs' e> q |
  b, <fs' b d> q |
  g, <g' b>8 <g cs> <g d'>4 |
  fs, <cs' fs as> <fs as cs> |
  <as cs fs> r r |
}

editorial.above.C′ = {
  \barNumberCheck #65
  s2.*15 |
  s2 \long_accent_above s8..\> s32\! |
}

editorial.between.C′ = {
  \barNumberCheck #65
  s2.*16 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A repeats, ending with a final 2-beat measure

upper.final = \relative {
  \barNumberCheck #96
  b'4\) r
}

lower.final = \relative {
  \barNumberCheck #96
  <b d>4 b,
}

editorial.above.final = {
  \barNumberCheck #96
  s4 s4
}

editorial.between.final = {
  \barNumberCheck #96
  s4 s4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% breaks_ref to match NE 2a

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s4 |
  s2.*5 |
  \break \barNumberCheck #6
  s2.*6 | \break
  \break \barNumberCheck #12
  s2.*6 | %% volta 16a/16b
  \break \barNumberCheck #17
  s2.*7 |
  \break \barNumberCheck #24
  s2.*7 |

  \pageBreak \barNumberCheck #31
  s2.*6 |
  \break \barNumberCheck #37
  s2.*6 |
  \break \barNumberCheck #43
  s2.*6 |
  \break \barNumberCheck #49
  s2.*7 |
  \break \barNumberCheck #56
  s2.*7 |

  \pageBreak \barNumberCheck #63
  s2.*7 |
  \break \barNumberCheck #70
  s2.*6 |
  \break \barNumberCheck #76
  s2.*7 |
  \break \barNumberCheck #83
  s2.*7 |
  \break \barNumberCheck #90
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global
      \editorial.above.A_anacrusis
      \editorial.above.A
      \editorial.above.A_volta.1
      \editorial.above.A_volta.2
      \editorial.above.B
      \editorial.above.A′
      \editorial.above.C
      \editorial.above.C′
      \editorial.above.A
      \editorial.above.final
    }
    \new Staff = "up" {
      \global
      \upper.A_anacrusis
      \repeat volta 2 {
        \upper.A
      }
      \alternative {
        \upper.A_volta.1
        \upper.A_volta.2
      }
      \upper.B
      \upper.A′
      \sectionLabel "TRIO"
      \upper.C
      \upper.C′
      \section
      \key b \minor
      \upper.A
      \upper.final
      \bar "|."
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \editorial.between.A_anacrusis
      \editorial.between.A
      \editorial.between.A_volta.1
      \editorial.between.A_volta.2
      \editorial.between.B
      \editorial.between.A′
      \editorial.between.C
      \editorial.between.C′
      \editorial.between.A
      \editorial.between.final
    }
    \new Staff = "down" {
      \global
      \lower.A_anacrusis
      \lower.A
      \lower.A_volta.1
      \lower.A_volta.2
      \lower.B
      \lower.A′
      \lower.C
      \lower.C′
      \section
      \key b \minor
      \lower.A
      \lower.final
    }
    %% No editorial markings below the grand staff
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
