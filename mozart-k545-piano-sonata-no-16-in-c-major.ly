\version "2.20.0"
\language "english"
\pointAndClickOff

% Append markup in the text property to the grob
#(define (append-markup grob old-stencil)
  (ly:stencil-combine-at-edge
    old-stencil X RIGHT (ly:text-interface::print grob)))

bassToTreble = {
  \clef treble
  % Fake staff clef appearance
  \once \override Staff.Clef.glyph-name = #"clefs.F"
  \once \override Staff.Clef.Y-offset = #1
  % Make sure any key signatures will printed with respect to
  % correct middle c position expected for bass clef
  \once \set Staff.middleCClefPosition = 6
  % Append change clef to the time signature
  \once \override Staff.TimeSignature.text = \markup {
    \hspace #1.2
    \lower #1
    \musicglyph "clefs.G_change"
  }
  \once \override Staff.TimeSignature.stencil = #(lambda (grob)
    (append-markup grob (ly:time-signature::print grob)))
}

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

%% Mozart catalogued this 1788 work as "Eine kleine klavier Sonate für
%% anfänger" (a little piano sonata for beginners). The autograph is
%% lost. It was first published posthumously.
\header {
  title = "Piano Sonata No. 16"
  subsubtitle = \markup { \italic "Sonate facile pour le pianoforte" "(1805)" }
  composer = "Wolfgang Amadeus Mozart"
  opus = "K. 545 (1788)"
  tagline = ##f
}

MONE_global = {
  \key c \major
  \time 4/4
  \tempo Allegro
}

MONE_A_upper = {
  \relative c'' {
    c2 e4 g |
    b,4.( c16 d c4) r |
    a'2^3 g4 c |
    g^1
    <<
      { f8(\trill^\finger "2-4" e16^1 f^3) e4 }

      \new Staff \with {
        \remove Time_signature_engraver
        alignAboveContext = "up"
        \magnifyStaff #2/3
        firstClef = ##f
      }
      { \once \override TupletBracket.bracket-visibility = ##f
        \tupletUp \tuplet 3/2 { f16 g \set stemRightBeamCount = #1 f }
        \set stemLeftBeamCount = #1
        \set stemRightBeamCount = #2
        e f e4 }
    >> r |
    a,8^1 b16 c d^1 e f g a g f e d c^4 b a |
    g8 a16 b c^1 d e f g f e d c b^4 a g |
    f8 g16 a b^1 c d e f e d c b a g f |
    e8 f16 g a b c d e d c b a g f e |
    d8 e16 f g a b cs d a^1 b cs d^1 e f g |
    a^1 b c b a g^4 f e f^1 g a g f e^4 d c |
    b8 g'^\markup { \italic "stacc." } e c d g e c |
    d4 <g d b> g, r |
    R1 |
    d''8( b) g4.( a16 b a8) g-. |
    g8.\trill^\finger "1-3"( fs16^2) fs4^3 r2 |
    d'8( b) g4.( a16 b a8) g-. |
    g8.\trill( fs16^2) fs4^3 r2 |
    d'4 r16 d b g e4 r16 e g e |
    c'4 r16 c a fs d4 r16 d fs d |
    b'4 r16 b g e c4 r16 c e c |
    a'4 r16 a fs c b4 r16 g' d b |
    a2 \acciaccatura b8^2 c4 \acciaccatura ds8^2 e4 |
    \acciaccatura gs8^2 a4. b32^4 a gs a^1 c8^3( a) c^4( a^2) |
    b8 g d'2 c16 b a g |
    \afterGrace 16/17 a1\startTrillSpan { s16\stopTrillSpan g16[ a] } |
    g4 g16 d g b d b^3 g^1 b^2 c a^1 fs^2 a^4 |
    g4 g,16 d g b d b g b c a fs a |
    g4 <d'_2 b'> <b g'> r |
  }
}

MONE_A_lower = {
  \relative c' {
    \bassToTreble
    \clef treble
    c8 g' e_3 g c, g' e g |
    d g f g c, g' e g |
    c, a' f_2 a c, g' e g |
    b, g' d_4 g c,_5 g' e g | \break
    f4 r r
    \clef bass
    <c f,> |
    <c e,> r r q |
    <c d,> r r <b d,> | \break
    <c c,> r r <e, c> |
    <a f>1 |
    f4._3 g8 a4. fs8 | \break
    g,16 b d g g, c e g g, b d g g, c e g |
    g,4 g' g, r |
    cs'16_2 d cs d cs d cs d c^3 d^1 c^2 d c d c d |
    b_3 d \repeat unfold 7 { b d } |
    c d b d a d b d c d b d c d a d |
    \repeat unfold 8 { b d } |
    c d b d a d b d c d b d c d a d |
    \clef treble
    r b d g b4 r16 c, e g c4 |
    r16 a, c fs a4 r16 b, d fs b4 | \break
    r16 g, b e g4 r16 a, c e a4 |
    r16 fs, a d fs4 r16 g, b d g4 |
    <e c>8 \repeat unfold 7 q | \break
    <e c>8 \repeat unfold 7 q |
    \repeat unfold 4 { d16 b' g b } |
    \repeat unfold 4 { d, c' fs, c' } | \break
    <b_2 g_4>4 r r <c a d,> |
    <b g> r r
    \clef bass
    <c, a d,> |
    <b g> <g g,> q r |
  }
}

MONE_A_dynamics = {
  \override DynamicTextSpanner.style = #'none
  %% m1
  s1 \mf |
  \repeat unfold 7 { s1 | }
  %% m9
  s4 s8 s8 \cresc s2 |
  s1 |
  %% m11
  s8 \f s8 s4 s2 |
  s1 |
  %% m13
  s16 \p s16 s8 s4 s2 |
  \repeat unfold 8 { s1 | }
  s2 \cresc s2 |
  s1 |
  s8 \f s8 s4 s2 |
}

MONE_A_pedal = {
}

\score {
  \new PianoStaff \with { instrumentName = \markup { \abs-fontsize #18 { "16" } } } <<
    \new Staff = "up" {
      \clef treble
      \MONE_global
      \repeat volta 2 {
        \MONE_A_upper
      }
    }
    \new Dynamics {
      \MONE_global
      \MONE_A_dynamics
    }
    \new Staff = "down" {
      \clef bass
      \MONE_global
      \MONE_A_lower
    }
    \new Dynamics {
      \MONE_global
      \MONE_A_pedal
    }
  >>
}
