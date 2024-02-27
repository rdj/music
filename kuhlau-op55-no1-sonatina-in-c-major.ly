\version "2.24.3"
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
  g2\)\( f8 e d c |
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

I.score = {
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% II. Vivace AABAA′CAB′D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

II.global = {
  \key c \major
  \time 3/8
  \tempo Vivace
}

II.breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s8 |
  s4. * 5 | \break
  \barNumberCheck #6
  s4. * 5 | \break
  \barNumberCheck #11
  s4. * 5 | \break
  \barNumberCheck #16
  s4. * 5 | \break
  \barNumberCheck #21
  s4. * 5 | \pageBreak
  \barNumberCheck #26
  s4. * 5 | \break
  \barNumberCheck #31
  s4. * 5 | \break
  \barNumberCheck #36
  s4. * 6 | \break
  \barNumberCheck #42
  s4. * 5 | \break
  \barNumberCheck #47
  s4. * 6 | \pageBreak
  \barNumberCheck #53
  s4. * 7 | \break
  \barNumberCheck #60
  s4. * 7 | \break
  \barNumberCheck #67
  s4. * 7 | \break
  \barNumberCheck #74
  s4. * 7 | \break
  \barNumberCheck #81
  s4. * 6 | \pageBreak
  \barNumberCheck #87
  s4. * 6 | \break
  \barNumberCheck #93
  s4. * 6 | \break
  \barNumberCheck #99
  s4. * 5 | \break
  \barNumberCheck #104
  s4. * 6 | \break
  \barNumberCheck #110
}

% Does not include the pickup beat since the phrasing varies slightly, the caller should have an open \(
II.upper.main_theme = \relative {
  g'8-.[\) g-.] e'16\( c |
  g8-.[\) g-.] e'16\( c |
  b8-.\) <f' b,>-. q-. |
  q4-- f16\( d |
  b-.\) a'\( g f e d |
  c b a g a b |
  c g e' c b d |
  c4\)
}

II.lower.main_theme = \relative {
  r8 |
  \X 2 { <c' e>8-. q-. r | }
  <g d'>-. q-. q-. |
  q4-- r8 |
  q4.~ |
  4. |
  <c e>8-. q-. <d g,>-. |
  <c e>4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AA = mm. 0.3 - 16.2

II.upper.AA = \relative {
  \clef treble
  e''16\( c |
  \II.upper.main_theme
  e16\( c |
  \II.upper.main_theme
}

II.lower.AA = \relative {
  \clef bass
  \II.lower.main_theme
  \II.lower.main_theme
}

II.editorial.above.AA = {
  s8 | s4. * 15 | s4
  \barNumberCheck #16
}

II.editorial.between.AA = {
  s8\p |
  s4. * 7 |
  s4 s8\f |
  s4. * 7 |
  s4
}

II.editorial.below.AA = {
  s8 | s4. * 15 | s4
  \barNumberCheck #16
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. 16.3 - 36.2

II.upper.B = \relative {
  c''16\( b |
  a8-.\) a-. a-. |
  d4 b16\( g |
  fs8-.\) 8-. 8-. |
  a16\( g fs g b8\) |
  b8-. b-. b-. |
  e4 c16\( a |
  gs8-.\) 8-. 8-. |
  b16\( a gs a c8\) |
  r16 d,\( ds e f fs |
  g gs a as b c |
  cs d ds e f fs |
  g gs a as b8\) |
  r16 d,\( ds e f fs |
  g gs a as b c |
  \ottava #1
  cs d ds e f fs |
  g8\) f16\( g a f |
  d e f d b c |
  d b f g a f |
  \ottava #0
  d e f d b c |
  d b g8\)
}

II.lower.B = \relative {
  r8 |
  <fs c' d>8-. q-. q-. |
  <g b d>4. |
  <a c d>8-. q-. q-. |
  <b d>4 r8 |
  <gs d' e>8-. q-. q-. |
  <a c e>4. |
  <b d e>8-. q-. q-. |
  <c e>4 r8 |
  <d, a' c>4. |
  <d g b>4. |
  <d fs a>4 <d a' c>8 |
  <d g b>4. |
  <d a' c>4. |
  <d g b>4. |
  <d fs a>4 <d a' c>8 |
  <g b>4 r8 |
  <g b d f>4.~ |
  q~ |
  q~ |
  q4
}

II.editorial.above.B = {
  s8 | s4. * 19 | s4
  \barNumberCheck 36
}

II.editorial.between.B = {
  s8\p |
  s4. |
  s4\sf s8 |
  s4. * 2 |
  s8\mf s4 |
  s4\sf s8 |
  s4. * 2 |
  s16 s\p s4 |
  s16 s^\markup \italic { cresc. } s4 |
  s4. * 2 |
  s16 s\f s4 |
  s4. * 3 |
  s8. s^\markup \italic { dim. } |
  s4. * 2 |
  s4
}

II.editorial.below.B = {
  s8 | s4. * 19 | s4
  \barNumberCheck 36
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AA′ = mm. 36.3 - 52.2

II.upper.AA′ = \relative {
  e''16\( c |
  \II.upper.main_theme
  e'16\( c |
  \transpose c c' \II.upper.main_theme
}

II.lower.AA′ = \relative {
  \II.lower.main_theme
  <<
    { s8 \clef treble }
    \transpose c c' \II.lower.main_theme
  >>
}

II.editorial.above.AA′ = {
  s8 | s4. * 15 | s4
  \barNumberCheck 52
}

II.editorial.between.AA′ = {
  s8 |
  s4. * 7 |
  s4 s8\p |
  s4. * 7 |
  s4
}

II.editorial.below.AA′ = {
  s8 | s4. * 15 | s4
  \barNumberCheck 52
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C = mm. 36.3 - 52.2

II.upper.C = \relative {
  c''8\( |
  \bar "||"
  \key f \major
  c4 a'16 f |
  c4 a16 d |
  c4 bf16 g |
  e4\) e8^\( |
  f4 f8 |
  f8. g16 <f a>8 |
  q4. |
  <e g>8\) c'\( c |
  c4 a'16 f |
  c4 a16 d |
  c4 bf16 g |
  e4\) e8^\( |
  f4 f8 <f a>4 <e g>8 |
  q4. |
  f4\) a'16\( g |
  \bar "||"
  \key c \major
  f8-.\) f-. f16\( e |
  d8-.\) d-. d16\( c |
  b8-.\) b-. b-. |
  b4-- a'16\( g |
  b,8\) r a'16\( g |
  c,8\) r a'16\( g |
  d4.~-> |
  8.[\) ds16]\(
}

II.lower.C = \relative {
  r8
  \key f \major
  \clef bass
  \X 2 { f8 a c | }
  e, g c |
  g bf c |
  \X 2 { f, a c | }
  a, c' c |
  c4 r8 |
  \X 2 { f, a c | }
  e, g c |
  g bf c |
  f, a c |
  c, c' c |
  c, c' bf |
  <f a>4. |
  \clef treble
  \bar "||"
  \key c \major
  \X 2 { <f' a>8-. q-. r | }
  <f g>-. q-. q-. |
  q4-- r8 |
  q r r |
  <e g> r r |
  <g f b,>4.~ |
  q4
}

II.editorial.above.C = {
  s8 |
  \barNumberCheck 53
  s4-\markup \italic { espressivo } s8 |
  s4. * 22 |
  s4
  \barNumberCheck 76
}

II.editorial.between.C = {
  s8 |
  s4^\markup \italic { dolce } s8 |
  s4. * 3 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,RIGHT)
  s8\< s4 |
  s4 s16 s\! |
  s8\> s8 s8\! |
  s4. * 5 |
  s4 s8\< |
  s16 s\> s8 s8 |
  s4. |
  s8 s\! s16\pp s |
  s4. |
  s8^\markup \italic { poco cresc. } s4 |
  s4. * 5 |
  s8. s16\p
}

II.editorial.below.C = {
  s8 |
  \barNumberCheck 53
  s4-\markup \italic { legato } s8 |
  s4. * 22 |
  s4
  \barNumberCheck 76
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AB′ = mm. 76.3-104.2

II.upper.AB′ = {
  \relative { e''16 c | }
  \II.upper.main_theme

  \relative {
    bf'16\( a |
    g8-.\) g-. g-. |
    c4 a16\( f |
    e8-.\) e-. e-. |
    g16\( f e f a8\) |
    a8-. a-. a-. |
    d4  b16\( g |
    fs8-.\) 8-. 8-. |
    a16\( g fs g b8\) |
    d8-. d-. d-. |
    g4 e16\( c |
    b8-.\) b-. b-. |
    d16\( c b c e8\) |
    r16 g,\( gs a bf b |
    c cs d ds e f |
    fs g gs a bf b |
    \ottava 1
    c cs d ds e8\) |
    r16 g,\( gs a bf b |
    c cs d ds e f |
    fs g gs a bf b |
    c4\)
    \ottava 0
  }
}

II.lower.AB′ = {
  <<
    { s8 | s4. * 2 | \clef bass }
    \II.lower.main_theme
  >>

  \relative {
    r8 |
    <e bf' c>8-. q-. q-. |
    <f a c>4. |
    <g bf c>8-. q-. q-. |
    <a c>4 r8 |
    <fs c' d>8-. q-. q-. |
    <g b d>4. |
    <a c d>8-. q-. q-. |
    <b d>4 r8 |
    \clef treble
    <b f' g>8-. q-. q-. |
    <c e g>4. |
    <d f g>8-. q-. q-. |
    <e g>4 r8 |
    \clef bass
    <g, d' f>4. |
    <g c e>4. |
    <g b d>4 <g d' f>8 |
    <g c e>4. |
    <g d' f>4. |
    <g c e>4. |
    <g b d>4 <g d' f>8 |
    <c e>4
  }
}

II.editorial.above.AB′ = {
  s8 |
  \barNumberCheck 77
  s4. * 27 | s4
  \barNumberCheck 104
}

II.editorial.between.AB′ = {
  s8 |
  \barNumberCheck 77
  s4. * 9 |
  s4\sf s8 |
  s4. * 3 |
  s4\sf s8 |
  s4. * 2 |
  s8\f s4 |
  s4\sf s8 |
  s4. * 2 |
  s16 s\p s4 |
  s8 s8^\markup \italic { cresc. } s8 |
  s4. * 2 |
  s16\f s s4 |
  s4. * 2 |
  s4
  \barNumberCheck 104
}

II.editorial.below.AB′ = {
  s8 |
  \barNumberCheck 77
  s4. * 27 | s4
  \barNumberCheck 104
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D = mm. 36.3 - 52.2

II.upper.D = \relative {
  \X 2 { c'16\( e | g8[-.\) 8]-. }
  g16\( c |
  <e g,>4--\) <d f,>8 |
  <c e,>4
  \X 2 { c16\( e | g8[-.\) 8]-. }
  g16\( c |
  <e g,>4--\) <d f,>8 |
  <c e,>4 \tuplet 3/2 { g,16\( a b } |
  c4\) \tuplet 3/2 { g,16\( a b } |
  c4\) \tuplet 3/2 { g'16\( a b } |
  c8\) <c g e>-. q-. |
  q4--
}

II.lower.D = \relative {
  \X 2 { c16\( e | g8[-.\) 8]-. }
  r8 |
  r g16\( a b g |
  c4\)
  \clef treble
  \X 2 { c16\( e | g8[-.\) 8]-. }
  r8 |
  r g16\( a b g |
  c4\)
  \clef bass
  \tuplet 3/2 { g,16\( a b } |
  c4\) \tuplet 3/2 { g,16\( a b } |
  c4\) \tuplet 3/2 { g'16\( a b } |
  c8\) c,-. c-. |
  c4--
}

II.editorial.above.D = {
}

II.editorial.between.D = {
  \barNumberCheck 104
  s16\f s |
  s4. |
  s4 s16\p s |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,RIGHT)
  s4\> s16 s\! |
  s4 s16\f s |
  s4. |
  s4 s16\p s |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,RIGHT)
  s4\> s16 s\! |
  s4 s8\ff |
  s4. * 3 |
  s4
}

II.editorial.below.D = {
}

II.score = {
  \new PianoStaff <<
    \new Dynamics {
      \II.global
      \partial 8
      \II.editorial.above.AA
      \II.editorial.above.B
      \II.editorial.above.AA′
      \II.editorial.above.C
      \II.editorial.above.AB′
      \II.editorial.above.D
    }
    \new Staff = "up" {
      \II.global
      \II.upper.AA
      \II.upper.B
      \II.upper.AA′
      \II.upper.C
      \II.upper.AB′
      \II.upper.D
      \fine
    }
    \new Dynamics {
      \II.global
      \II.editorial.between.AA
      \II.editorial.between.B
      \II.editorial.between.AA′
      \II.editorial.between.C
      \II.editorial.between.AB′
      \II.editorial.between.D
    }
    \new Staff = "down" {
      \II.global
      \II.lower.AA
      \II.lower.B
      \II.lower.AA′
      \II.lower.C
      \II.lower.AB′
      \II.lower.D
      \fine
    }
    \new Dynamics {
      \II.global
      \II.editorial.below.AA
      \II.editorial.below.B
      \II.editorial.below.AA′
      \II.editorial.below.C
      \II.editorial.below.AB′
      \II.editorial.below.D
    }
    \new Dynamics {
      \II.global
      \II.breaks_ref
    }
  >>
}

\score { \I.score }
\score {
  \header {
    %% Do not repeat the opus
    piece = " "
    opus = " "
  }
  \II.score
}

