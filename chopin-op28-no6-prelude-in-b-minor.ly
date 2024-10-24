\version "2.24.0"
\language "english"
\pointAndClickOff

X = #(define-music-function (num music) (integer? ly:music?) #{ \repeat unfold $num $music #})

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
  % markup-system-spacing = #0
  % top-margin = #4
  % bottom-margin = #4
}

\header {
  title = "Prelude in B minor"
  subsubtitle = \markup { "No. 6 from" \italic "24 Préludes pour le Piano" "(1839)" }
  composer = "Frédéric Chopin"
  opus = "Op. 28, No. 6"
  tagline = ##f
}

\layout {
  \context {
    \Score

    %% Pedal marks by default have zero width, allowing, them to
    %% horizontally overlap. This restores their natural width so that
    %% \sustainOff can be arbitrarily close to \sustainOn but not run
    %% into it.
    \override SustainPedal.extra-spacing-width = #'(0 . 0)

    \omit TupletBracket
  }
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
  }
}

global = {
  \tempo "Lento assai"
  \key b \minor
  \time 3/4
}

upper_soprano = \relative {
  \X 3 { b'8->[( b]) } |
  \X 3 { b[ b] } |
  b[ b] d[ d] d[ d] |
  \X 3 { d[ d] } |
  \X 3 { d[ d] } |
  d[ d] cs[ cs] <cs as>[\(  <d b>] |
  e4. fs8 e16 d \slashedGrace d8 cs16 b |
  \oneVoice
  <as fss cs>8 <b gs d> <d b d,> <cs as cs,>\) r4 |
  \voiceOne

  \X 3 { \X 3 { b8[ b] } | }
  \X 3 { c[ c] } |
  \X 3 { c[ c] } |
  \X 2 { c[ c] } b[ b] |
  \X 2 { as[ as] } b[ b] |
  b[ b] as[ as] b[ b] |
  b[ b] b[ b] as[ as] |
  as[ as] b[ b] b[ b] |
  b[ b] as[ as] b[ b]
  b[ b] as[ as] b[ b]
  b[ b] b[ b] as[ as] |
  b[ b] b[ b] a[->( a]) |
  \X 2 { \X 3 { fs[ fs] } | }
  fs[ fs] \oneVoice r4 \voiceOne fs8[\( fs] |
  fs[ fs]\) \oneVoice r4 r |
}

upper_alto = \relative {
  <fs' d>4 fs fs |
  q q q |
  q b b |
  <b fs> q q |
  <b g> b b |
  <b gs> q g |
  <as g>8[ <b g>] <as g>[ <cs fs,>] <b fs>[ fs] |
  s2. |

  <fs d>4 fs fs |
  q q q |
  <g d> g g |
  g <g e> q |
  q g q |
  g g g |
  <g cs,> <fs cs> <fs d> |
  <g cs,> q <g d> |
  q <fs cs> <e cs> |
  q <d b> <g d> |
  <g cs,> <fs cs> <fs d> |
  <g cs,> q <g d> |
  q <fs cs> q |
  <fs d> q q |
  d s s |
  d d d |
  d s d |
  d s s |
}

upper = {
  \clef treble
  <<
    \new Voice = "soprano" {
      \voiceOne
      \upper_soprano
    }
    \new Voice = "alto" {
      \voiceTwo
      \upper_alto
    }
  >>
}

lower = \relative {
  \clef bass
  b,16\( d fs b d4 cs8. d16 |
  b4. fs8 d cs\) |
  b16\( fs' b d fs4 e8. fs16 |
  d4. b8 fs d\) |
  g,16\( d' b' d g4 fs |
  fs es e8 d |
  cs \slashedGrace e d cs as b d, |
  e es fs4\)

  d8\( cs |
  b16 d fs b d4 cs8. d16 |
  b4. fs8 d b\) |
  g16\( d' g b d4 e8 f |
  e4. c8 g c,\) |
  c,16\( g' e' g e'4\)
  c,,16\( g' e' g |
  e'2\) r4 |

  e,4.\( fs8 e16 d cs b\) |
  e4.\( fs8 e16 d cs b |
  a g d e fs2 |
  g\) g'4\( |
  e4. fs8 e16 d cs b |
  e4. fs8 e16 d cs b |
  a g d e fs2 |
  b,2.\) |

  b16\( b' fs' b d4 cs8. d16 |
  b4. fs8 d cs |
  b2.~\) |
  4 r r |
}

between = {
  s2.-\markup \italic { sotto voce } |
  s2. * 6 |
  s8\< s8\! s8\> s8\! s4 |
  s2. * 4 |
  s8\f s4. s8\p s8 |
  s2. |
  s8_\markup \italic { cresc. } s8 s2 |
  s4 s8\f s8 s4 |
  s4 s16 s16\> s8 s8 s8\! |
  s2. * 2 |
  s4 s8\pp s8 s4 |
}

below = {
  \X 2 {
    \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,CENTER)
    s4\< s4\! s4 |
    s8
    \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
    s8\> s4 s8 s8\! |
  }
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,CENTER)
  s4\< s4\! s4 |
  s2. * 3 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,CENTER)
  s4\< s4\! s4 |
  s8
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s8\> s4 s8 s8\! |
  s16 s16\< s8 s4 s8 s8\! |
  s2. |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s16\< s s s s4\!
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  \once \override Hairpin.to-barline = ##f
  s16\< s s s | s2\! s4 |
  s2. |
  s2 s8 s16 s-\markup \italic { sostenuto } |
  s2. * 6 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s16\< s s s s4\! s4 |
  s4
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s8\> s s s\! |
}

pedal = {
  s2. * 12 |
  s16\sustainOn s s s s4 s16\sustainOff\sustainOn s s s | s2 s4\sustainOff |
  s2. * 8 |
  s16\sustainOn
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% breaks_ref to match NE

breaks_ref = {
  s2. * 4 | \break
  \barNumberCheck 5
  s2. * 4 | \break
  \barNumberCheck 9
  s2. * 3 | \break
  \barNumberCheck 12
  s2. * 3 | \break
  \barNumberCheck 15
  s2. * 4 | \break
  \barNumberCheck 19
  s2. * 4 | \break
  \barNumberCheck 23
  s2. * 4 |
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Staff = "up" {
      \global
      \upper
      \bar "|."
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
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #UP
    }{
      \global
      \pedal
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
