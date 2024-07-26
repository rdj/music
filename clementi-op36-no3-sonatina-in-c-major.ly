\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

\header {
  title = "Sonatina in C major"
  subsubtitle = \markup { "No. 3 from" \italic "Six Progressive Sonatinas for the Pianoforte" "(1797)" }
  composer = "Muzio Clementi"
  opus = "Op. 36, No. 3"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
    %% \override TupletBracket.bracket-visibility = ##t

    %% Override the default positions of the "tr" trill script,
    %% bringing it inside slurs
    scriptDefinitions = #(cons*
                          `(trill . ,(acons 'avoid-slur 'inside (assoc-get 'trill default-script-alist)))
                          default-script-alist)
  }
}

twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})
X = #(define-music-function (num music) (integer? ly:music?) #{ \repeat unfold $num $music #})

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% I. Spiritoso
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I.global = {
  \key c \major
  \time 4/4
  \tempo "Spiritoso."
}

I.breaks_ref = {
  %% breaks matching some reference for ease of authoring
  \autoBreaksOff
  s1 * 4 | \break
  s1 * 5 | \break
  s1 * 5 | \break
  s1 * 3 | \break
  s1 * 4 | \break
  s1 * 5 | \break
  s1 * 5 | \pageBreak
  s1 * 5 | \break
  s1 * 5 | \break
  s1 * 5 | \break
  s1 * 4 | \break
  s1 * 4 | \break
  s1 * 5 | \break
  s1 * 5 | \pageBreak
}

% A = mm. 1-12

I.upper.A = \relative {
  \clef treble
  g''4.\( e8 c g-.\) g-. g-. |
  g'4.\( e8 c16\)\( d e f g a b c |
  b8 a-.\) a-. a-. b16\( a gs a c8-.\) a-. |
  fs( g) g-. g-. g4 r |
  <f d>8-. q-. <e c>-. q-. <d b>4 r |
  <g e>8-. q-. <f d>-. q-. <e c>4 r |
  a16\( f e d a' f e d e g e c d f d b |
  c8-.\) c-. <d b>-. q-. <e c> r r4 |
  <f, d>8-. q-. <e c>-. q-. <d b>4 r |
  <g e>8-. q-. <b f>-. q-. <c e,>-. q-. <cs g>-. q-. |
  <d a>-. q-. <f d>-. q-. <e c>-. q-. <d b>-. q-. |
  c4-. <c' g e>-. q-. r |

  g4\( a16 g fs e d4 e16 d c b |
  a8-.\) \acciaccatura b8 a16\( gs a8-.\) b-. c8 r r c'16\( b |
  a b a b c b a b c b a g fs e d c |
  b8\) r r16 g\( a b c d e fs g a b a |
  g8\) r r16 g,\( a b c d e fs g a b c |

  d8-.\) d-. c16\( b a b\) g8-. g-. ds-. ds-. |
  e-. e-. d16\( c b c a8-.\) a-. e-. e-. |
  d-. d-. d'16\( b a g \afterGrace 7/8 a2\trill { g16 a\) } |
  r8 d'-. r b-. r g-. r ds-. |
  r e16\( ds e fs g fs e d c b a g fs e |
  d g b d c b a g
  %\once \override Script.avoid-slur = #'inside
  %\override Script.avoid-slur = #'inside
  \afterGrace 7/8 a2\trill { g16 a } |
  g8\) r d-. d-. <b g'>-. r d-. d-. |
  <c a'>-. r d-. d-. <fs a,>-. r d-. d-. |
  <g b,>4 q q r |
}

I.lower.A = \relative {
  \clef treble
  e'8\( c e c e c e c\) |
  e c e c e c e c |
  f c f c f c f c |
  e c e c e c e c |
  g'4 r g8-. g-. f-. f-. |
  e4 r a8-. a-. g-. g-. |
  f r r f-. g-. r
  \clef bass
  g,-. r |
  c-. r g-. r c\( g e c |
  g'4\) r g8-. g-. f-. f-. |
  e-. r gs-. r a-. r e-. r |
  f-. f-. d-. d-. g-. g-. g,-. g-. |
  c4-. <c c,>-. q-. r |

  \twice { g'8[\( b] d\) r } |
  \twice { g,[\( c] e\) r } |
  \twice { fs,[\( a] d\) r } |
  g,\([ b] d\) r r2 |
  e,8\([ g] b\) r r2 |

  b,8\( g' b, g' b, g' b, g'\) |
  \X 4 { c, g' } |
  \twice { d g } \twice { d fs } |
  \X 4 { b, g' } |
  \X 4 { c, g' } |
  \twice { d g } \twice { d fs } |

  \X 4 { g,8-. g'-. r4 } |
  g,8\( g' d b g4\) r |
}

I.editorial.between.A = {
  %% marks between the staves, e.g. dynamics
  s1\f |
  s1 * 3 |
  s1\p |
  s1 * 3 |
  s16 s16-\markup \italic { cresc. } s8 s4 s4 s4 |
  s1 |
  s1\f |
  s1 |

  s1-\markup \italic { dolce } |
  s1 * 3 |
  s2 s2-\markup \italic { cresc. } |
  s1\f |
  s1 * 2 |
  s1\p |
  s1-\markup \italic { cresc. } |
  s1\f |
  s1 |

  s4 s4\p s16 s16-\markup \italic { cresc. } s8 s4 |
  s1\f |
}

I.upper.B = \relative {
  g'4.\( b8 d g-.\) g-. g-. |
  a,16\( b c b a b c b a8\) r r4 |
  b4.\( d8 f b-.\) b-. b-. |
  c,\( d16 e f g a b c8\) r r4 |
  d8-. d-. b-. b-. g-. g-. g16\( a b g |
  c8-.\) c-. g-. g-. ef-. ef-. c16\( d ef c |
  b8-.\) b-. af-. af-. g-. g-. fs-. fs-. |
  \X 4 { g-. g-. fs-. fs-. } |

  g4.\( e8 c g-.\) g-. g-. |
  g'4.\( e8 c16\)\( d e f g a b c |
  b8 a-.\) a-. a-. b16\( a gs a c8-.\) a-. |
  fs( g) g-. g-. g4 r |
  <f d>8-. q-. <e c>-. q-. <d b>4 r |
  <g e>8-. q-. <f d>-. q-. <e c>4 r |
  <<
    \relative {
      \voiceOne
      a'8-. a-. cs-. cs-. d-. d-. c-. c-. |
      b-. b-. ds-. ds-. e-. e-. e-. e-. |
      \X 8 { e-. } |
      f-. f-. g-. g-. a\( g f e |
      d-!\) \oneVoice r \voiceOne f-. f-. e-! \oneVoice r \voiceOne c-. c-. |
      b-!
    }
    \\
    \relative {
      \voiceTwo
      f'8 f g g f f fs fs |
      g g a a gs gs <b gs> q |
      <c a> q <d b> q c c cs cs |
      d d e e f e d c |
      b s b b c s fs, fs |
      g
    }
  >>
  r8 <f b,>-. q-. <e c>-! r
  \change Staff = "down"
  \voiceOne
  <c fs,>-. q-. |
  <b g>-!
  \change Staff = "up"
  \oneVoice
  r <g' d b>-. r q-. r r4 |

  c'4\( d16 c b a g4 a16 g f e |
  d8-.\) \acciaccatura e8 d16\( cs d8-.\) e-. f r r f'16\( e |
  d e d e f e d e f e d c b a g f |
  e8\) r r16 c\( d e f g a b c d e d |
  c8\) r r16 c,\( d e f g a b c d e d |
  c8-.\) c-. g-. g-. e-. e-. d16\( c b c |
  a8-.\) a-. f-. f-. d-. d-. a'-. a-. |
  g-. g-. a16\( g f e \afterGrace 7/8 d2\trill { c16 d } |
  e8\) r r16 c\( d e f g a b c d e d |
  c8-.\) r r16 c,16\( d e f g a b c d e f |
  g8-.\) g-. r e-. r c-. r gs-. |
  r a16\( gs a b c b a g f e d c b a |
  g c e g f e d c \afterGrace 7/8 d2\trill { c16 d } |
  c8\) r
  \clef bass
  g-. g-. <e c'>-. r g-. g-. |
  <f d'>-. r g-. g-. <d b'>-. r g-. g-. |
  <c e,>4-. q-. q-. r |
}

I.lower.B = \relative {
  b8\( g b g b g b g\) |
  \X 4 { c g } |
  \X 4 { d' g, } |
  \X 4 { e' g, } |
  \X 4 { f' g, } |
  \X 4 { ef' g, } |
  d' g, c g b g c g |
  <<
    { b4\( c b c | b\) } \\
    { g1 | g4 }
  >>
  r4 r2 |

  e8\( c e c e c e c\) |
  e c e c e c e c |
  f c f c f c f c |
  e c e c e c e c |
  g'4 r g8-. g-. f-. f-. |
  e4 r a8-. a-. g-. g-. |
  f-. f-. e-. e-. d4 r |
  g8-. g-. f-. f-. e-. e-. d-. d-. |
  c-. c-. b-. b-. a-. a-. g-. g-. |
  f-. f-. e-. e-. d\( e f fs |
  g\) \X 7 g |
  \X 4 g
  \voiceTwo
  \X 4 g
  |
  g-!
  \oneVoice
  \stemDown
  r <g g'>-. r q-. r r4 |
  \stemNeutral

  \clef treble
  \twice { c'8\([ e] g\) r } |
  \twice { c,\([ f] a\) r } |
  \twice { b,\([ d] g\) r } |
  c,[\( e] g\) r r2 |
  a,8[\( c] e\) r r2 |

  \clef bass
  e,8\( \X 3 { c' e, } c'\) |
  \X 4 { f, c' } |
  g c g c g b g b |
  c,[\( e] g\) r r2 |
  a,8[\( c] e\) r r2 |
  e,8\( \X 3 { c' e, } c'\) |
  \X 4 { f, c' } |
  g c g c g b g b |
  \X 4 { c,-. c'-. r4 } |
  <c, c'>4-. q-. q-. r |
}

I.editorial.between.B = {
  s1\p |
  s1 |
  s2 s2-\markup \italic { cresc. } |
  s1\f |
  s1\f |
  s1 |
  s8\> s4 s8\! s2-\markup \italic { dimin. } |
  s1 |
  s1\pp |
  s1\f |
  s1 * 3 |
  s1\p |
  s1 |
  s2 s2-\cresc |
  s1 |
  s2.\f s4\ff |
  s1 * 4 |
  s1-\markup \italic { dolce } |
  s1 * 3 |
  s2 s2-\markup \italic { cresc. } |
  s1\f |
  s1 * 4 |
  s8 s8\p s2. |
  s1-\markup \italic { cresc. } |
  s1\f |
  s4 s2.\p |
  s2 s2-\markup \italic { cresc. } |
  s1\f |
}

\score {
  \new PianoStaff \with { instrumentName = \markup { \abs-fontsize #18 { "3." } } } <<
    \new Staff = "up" {
      \I.global
      \repeat volta 2 {
        \I.upper.A
      }
      \I.upper.B
      \bar "|."
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
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
      \I.breaks_ref
    }
  >>
}
