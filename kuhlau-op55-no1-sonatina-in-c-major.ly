\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

\header {
  title = "Sonatina in C major"
  subsubtitle = \markup { "No. 1 from" \italic "6 Sonatinas for Piano" "(1823)" }
  composer = "Friedrich Kuhlau"
  opus = "Op. 55, No. 1 (1823)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
    %% \override TupletBracket.bracket-visibility = ##t
  }
}

X = #(define-music-function (num music) (integer? ly:music?) #{ \repeat unfold $num $music #})

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% I. Allegro AABB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I.global = {
  \key c \major
  \time 4/4
  \tempo "Allegro"
}

I.breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s1 * 5 | \break
  \barNumberCheck #6
  s1 * 6 | \break
  \barNumberCheck #12
  s1 * 5 | \break
  \barNumberCheck #17
  s1 * 5 | \break
  \barNumberCheck #22
  s1 * 5 | \break
  \barNumberCheck #27
  s1 * 5 | \pageBreak
  \barNumberCheck #32
  s1 * 5 | \break
  \barNumberCheck #37
  s1 * 5 | \break
  \barNumberCheck #42
  s1 * 6 | \break
  \barNumberCheck #48
  s1 * 5 | \break
  \barNumberCheck #53
  s1 * 5 | \break
  \barNumberCheck #58
  s1 * 5 | \pageBreak
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. |: 1-20 :|

I.upper.A = \relative {
  \clef treble
  c''4. g8\( e' c b d |
  c4.\) g8\( e' c b d |
  c8\) g\( a b c d e c |
  a' g fs g f e d c |
  <b f'>4-.\) q-. g8\( b d f |
  <c e>4-.\) q-. g8\( c e c |
  <b d>4\) <c e>( <b d>) <c e>( |
  <b d>8) d[\( e fs] g a b c |
  d2\)\( c8 b a g |
  fs4\) 4 4 4 |
  g g a8\( g fs g |
  a4.\) d,8\( e fs g a |
  b\)\( d c b a c b a |
  g b a g fs\)\( a d, fs |
  g4\) g,8\( a b c d e |
  fs\)\( g a b\) c\( a d fs, |
  g4\) b8\( a g fs e d |
  c\)\( b a g fs\) d\( c' fs, |
  g\) d\( c' fs, g\) d\( c' fs, |
  g\) \once \stemDown g\( b d g4\) r |
  \barNumberCheck #21
}

I.lower.A = \relative {
  \clef bass
  c4 <c' e>2 <g d'>4( |
  <c e>) q2 <g d'>4( |
  <c e>) r q r |
  q r r2 |
  <g d'>4-. q-. r2 |
  <c e>4-. q-. r2 |
  <g d'>4 <c e>( <g d'>) <c e>( |
  <g d'>) r r2 |
  \X 4 { b8 d } |
  \X 4 { <a c> d } |
  \X 4 { <g, b> d' } |
  \X 4 { <c fs,> d } |
  <g, b>4 r <c e> r |
  d r <c d,> r |
  <g b> r r2 |
  r2
  \clef treble
  <d' a'>2( |
  <g b>4) r r2 |
  r2
  \clef bass
  <d, a'>2( |
  <g b>4) <d a'>( <g b>) <d a'>( |
  <g b>) <g b d> q r |
  \barNumberCheck #21
}

I.editorial.above.A = {
  %% marks above the grand staff
  s1 * 20 |
  \barNumberCheck #21
}

I.editorial.between.A = {
  %% marks between the staves, e.g. dynamics
  s4\p s2. |
  s1 * 6 | \barNumberCheck #8
  s8 s8\< s8*5 s8\! |
  s2_\markup \italic { dolce e legato } s2 |
  s4 s8\< s8 s2 |
  s2 s4 s8 s8\! |
  s1 * 3 | \barNumberCheck #15
  s4 s4^\markup \italic { cresc. } s2 |
  s1 |
  s4 s4-\markup \italic { dim. } s2 |
  s2 s4 s8 s8-\markup { \whiteout \pad-markup #0.5 \italic "cresc." } |
  s1 |
  s8 s8\f s4 s2 |
  \barNumberCheck #21
}

I.editorial.below.A = {
  %% marks below the grand staff, e.g. pedal marks
  s1 * 20 |
  \barNumberCheck #21
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. |: 21 - 62 :|

I.upper.B = \relative {
  \barNumberCheck #21
  f''2\( g8 f e d |
  c4\)( b) b b |
  g2\( a8 b c d |
  ef1\) |
  ef4\( f8 ef d c bf af |
  g4\)( fs) fs fs |
  \once \stemDown
  g8 g\( b d g f ef d |
  f ef d c bf af g fs |
  \once \stemDown
  g\) g\( b d g f ef d |
  f ef d c bf af g fs |
  g4\) g8\( a b c d e |
  f4\) g8\( a b c d e |
  f4\) a8\( g f e d c |
  b a g f e d c b |
  c4.\) g8\( e' c b d |
  c4.\) g8\( e' c b d |
  c4.\) c8\( c' a gs b |
  a f e g f d cs e |
  d4.\) a8\( f' d cs e |
  d4.\) a8\( f' d cs e |
  d4.\) a8\( b cs d e |
  f g a g f e d c |
  <b f'>4-.\) q-. g8\( b d f |
  <c e>4-.\) q-. c8\( e g c |
  <bf e,>4-.\) q-. e,8\( g c bf |
  <a f>4-.\) q-. a8\( f d c |
  b4 c <d b> <e c> |
  <d f>\) r8 q8( <c e>4) r8 q8( |
  <b d>4) <c e>( <b d>) <c e>( |
  <b d>8) g'8\( a b c d e f |
  g2\)\( g8 e d c |
  b4\) b b b |
  c c d8\( c b c |
  d4.\) g,8\( a b c d |
  e\)\( g f e d f e d |
  c\)\( e d c b\)\( d g, b |
  c4\) c,8\( d e f g a |
  b\) c\( d e f d g b, |
  c4\) e8\( d c b a g |
  f\)\( e d c b\) g\( f' b, |
  c\) g\( f' b, c\) g\( f' b, |
  c\) c\( e g c4\) r |
  \barNumberCheck #63
}

I.lower.B = \relative {
  \barNumberCheck #21
  \X 2 { g8 d' b d } |
  \X 2 { g, f' d f } |
  \X 2 { g, e' c e } |
  \X 2 { g, ef' c ef } |
  \X 8 { af, c } |
  <g b>4 r r2 |
  <g c>4 r r2 |
  <g b>4 r r2 |
  <g c>4 r r2 |
  <g b>4 r r2 |
  \X 2 { <g b d>4 r r2 | }
  R1 |
  c,4 <c' e>2 <g d'>4( |
  <c e>) q2 <g d'>4( |
  <c e>4) q r2 |
  R1 |
  d,4 <d' f>2 <a e'>4( |
  <d f>4) q2 <a e'>4( |
  <d f>) q r2 |
  R1 |
  <g, d'>4-. q-. r2 |
  <c e>4-. q-. r2 |
  \clef treble
  <c g'>4-. q-. r2 |
  <f a>4-. q-. r2 |
  f8 g e g d g c, g' |
  b, g' fs g c, g' fs g |
  \X 2 { g, g' c, g' } |
  g,4 r r2 |
  \X 4 { e'8 g } |
  \X 4 { <d f> g } |
  \X 4 { <c, e> g' } |
  \X 4 { <b, f'> g' } |
  <c, e>4 r <f a> r |
  g r <f g,> r |
  <c e> r r2 |
  r2 <g' d'>2( |
  <c e>4) r r2 |
  r2
  \clef bass
  <g, d'>2( |
  <c e>4) <g d'>4( <c e>) <g d'>( |
  <c e>) <c e g> q r |
  \barNumberCheck #63
}

I.editorial.above.B = {
  %% marks above the grand staff
  \barNumberCheck #21
  s1 * 42 |
  \barNumberCheck #63
}

I.editorial.between.B = {
  %% marks between the staves, e.g. dynamics
  \barNumberCheck #21
  s8_\markup \italic { dolce e legato } s8 s2. |
  s1 |
  s2 s8\< s4 s8\! |
  s1\f |
  s4 s8^\markup \italic { dim. } s8 s2 |
  s1
  s8\mf s8\< s4 s8\> s8 s4 |
  s2 s4 s8 s8\! |
  s8 s8\p s8\< s8 s8\> s8 s4 |
  s2 s4 s8 s8\! |
  s4 s8^\markup \italic { cresc. } s8 s2 |
  s1
  s4\f s2. |
  s8\> s8 s4 s4 s8 s8\! |
  s4\p s2. |
  s1 * 5 |
  s2 s8\< s4. |
  s4 s8\> s8 s4 s8 s8\! |
  s1 |
  s2 s8^\markup \italic { cresc. } s4. |
  s1 * 4 |
  s4\f s2. |
  s8\p s8\< s2 s8 s8\! |
  s2\>_\markup \italic { dolce e legato }
  s8\! s4. |
  s4 s4^\markup \italic { cresc. } s2 |
  s1 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s8\sf\> s8 s8 s8\! s2 |
  s1 * 2 |
  s4 s8^\markup \italic { cresc. } s8 s2 |
  s1 * 4 |
  s8 s8\f s2. |
  \barNumberCheck #63
}

I.editorial.below.B = {
  %% marks below the grand staff, e.g. pedal marks
  \barNumberCheck #21
  s1 * 42 |
  \barNumberCheck #63
}

\score {
  \new PianoStaff \with { instrumentName = \markup { \abs-fontsize #18 { "1." } } } <<
    \new Dynamics {
      \I.global
      \repeat volta 2 {
        \I.editorial.above.A
      }
      \bar ":|.|:"
      \repeat volta 2 {
        \I.editorial.above.B
      }
    }
    \new Staff = "up" {
      \I.global
      \I.upper.A
      \I.upper.B
    }
    \new Dynamics {
      \I.global
      \I.editorial.between.A
      \I.editorial.between.B
    }
    \new Staff = "down" {
      \I.global
      \I.lower.A
      \I.lower.B
    }
    \new Dynamics {
      \I.global
      \I.editorial.below.A
      \I.editorial.below.B
    }
    \new Dynamics {
      \I.global
      \I.breaks_ref
    }
  >>
}
