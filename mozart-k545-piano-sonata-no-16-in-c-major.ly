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
    g8.\trill( fs16) fs4 r2 |
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
    cs'16_2 d cs d cs d cs d c^3 d^1 c^2 d c d c d | \break
    b_3 d \repeat unfold 7 { b d } |
    c d b d a d b d c d b d c d a d |
    \repeat unfold 8 { b d } | \break
    c d b d a d b d c d b d c d a d |
    \clef treble
    r b d g b4 r16 c, e g c4 |
    r16 a, c fs a4 r16 b, d fs b4 | \break
    r16 g, b e g4 r16 a, c e a4 |
    r16 fs, a d fs4 r16 g, b d g4 |
    <e c>8 \repeat unfold 7 q | \break
    \grace s8 % Grace skip needed to avoid line-breaking warning with acciaccatura in upper voice
    <e c>8 \repeat unfold 7 q |
    \repeat unfold 4 { d16 b' g b } |
    \repeat unfold 4 { d, c' fs, c' } | \break
    <b_2 g_4>4 r r <c a d,> |
    <b g> r r
    \clef bass
    <c, a d,> |
    <b g> <g g,> q r | \break
  }
}

MONE_A_dynamics = {
  \override DynamicTextSpanner.style = #'none
  %% m1
  s1 \mf |
  s1*7 |
  %% m9
  s4 s8 s8 \cresc s2 |
  s1 |
  %% m11
  s8 \f s8 s4 s2 |
  s1 |
  %% m13
  s16 \p s16 s8 s4 s2 |
  s1*8 |
  %% m22
  s2 \cresc s2 |
  s1 |
  %% m24
  s8 \f s8 s4 s2 |
  s1*4 |
}

MONE_A_pedal = {
}

MONE_B_upper = {
  \relative c'' {
    g4 g'16 d g bf-3 d bf g-1 bf-2 c a-1 fs-2 a-4 |
    g4 g,16 d g bf d bf g bf c a fs a |
    g4 r r16 g'-1 bf a g f? e d |
    cs4 r r16 cs' e d cs bf a g |
    f?4 d16 a d f a f-3 d-1 f-2 g e-1 cs-2 e |
    d4 d,16 a d f a f d f g e cs e |
    r d e f g a b? cs d4 r |
    r16 b c d e fs gs a b4 r |
    r16 a e' d c b a g? f?4 r |
    r16 g d' c b a g f e4 r |
    r16 f c' b a g f e d4 r |
    r16 e b' a gs f? e d c4 r |
    r16 bf-3 d c bf a g f-3 e f-1 g a bf c d e |
  }
}

MONE_B_lower = {
  \relative c {
    <g g'>4 r r
    \clef treble
    <c'' a d,> |
    <bf g> r r
    \clef bass
    <c, a d,> |
    r16 g, a bf c d e fs g4 r | \break
    r16 a, b? cs d e fs gs a4 r |
    <d, d,> r r
    \clef treble
    <g' e a,> |
    <f d> r r \clef bass <g, e a,> | \break
    <f d> r r16 d'-3 f e d c?-1 b a |
    gs4 r r16 gs b a gs f?-1 e d |
    c4 r r16
    \clef treble
    d' a' g f e d c | \pageBreak
    b4 r r16 c g' f e d c b |
    a4 r r16
    \clef bass
    b f' e d c b a |
    gs4 r r16 a-3 c b a g-1 f e | \break
    d2 <bf' g c,> |
  }
}

MONE_B_dynamics = {
  s1*13 |
}

MONE_B_pedal = {
}

MONE_C_upper = {
  \relative c'' {
    f2-1 a4 c |
    e,4.( f16 g) f4 r |
    d'2 c4 f |
    c bf8(\trill a16 bf) a4 r |
    d,8-1 e16 f g-1 a bf c d c bf a g f-4 e d |
    c8 d16 e f g a bf c bf a g f e-3 d c |
    bf8-2 c16-1 d e f-1 g a bf a g f e-3 d c bf-2 |
    a8 bf16 c d-1 e f g a g f e d c bf a |
    a'4 r r <a c,> |
    <g c,> r r q |
    <f c> r r <f b,?> |
    <e c> r r <e c> |
    d16 d, e f g a b cs d a b cs d e f g |
    a-1 b c? b a g-4 f e f-1 g a g f e-4 d c? |
    b8 g'^\markup { \italic "stacc." } e c d g e c |
    d4 <b d g> g r |
    R1 |
    g'8( e) c4.( d16 e d8) c-. |
    c8.(\trill-\finger "2 4" b16)-1 b4-3 r2 |
    g'8( e) c4.( d16 e d8) c-. |
    c8.(\trill b16) b4 r2 |
    g'4 r16 g e c a4 r16 a c a |
    f'4 r16 f d b g4 r16 g' b g e'4 r16 e c a f4 r16 f a f |
    d'4 r16 d b g e4 r16 c' g e |
    d2 \acciaccatura cs8 d4 \acciaccatura cs8 d4 |
    a'2 \acciaccatura gs8 a4 \acciaccatura gs8 a4 |
    g?8-1 a16 b c-1 d e d c b-4 a g f e-3 d c |
    \afterGrace 16/17 d1\startTrillSpan { s16\stopTrillSpan c16[ d] } |
    c4 c16-2 g c e g e-3 c-1 e-2 f d-1 b-2 d |
    c4 c,16 g c e g e c e f d b d |
    c4 <c'' g e> c, r |
  }
}

MONE_C_lower = {
  \relative c' {
    \clef treble
    f8 c' a c f, c' a c |
    g c bf c f, c' a c |
    f, d' bf d f, c' a c | \break
    e, c' g c f, c' a c |
    bf4 r r
    \clef bass
    <f bf,> |
    <f a,> r r q | \break
    <f g,> r r <e g,> |
    <f f,> r r2 |
    f,8-3 g16 a bf-4 c d e f-2 e-1 d c bf a-1 g f | \break
    e8 f16 g a b?-4 c d e d c b a-1 g f e |
    d8 e16 f g a b-3 c d c b a g-1 f e d |
    c8 d16 e f g a b c b a g f e d c | \break
    <f a>1 |
    f4. g8 a4. fs8 |
    g,16 b d g g, c e g g, b d g g, c e g | \pageBreak
    g,4 g' g, r |
    \clef treble
    fs''16-2 g fs g fs g fs g f-3 g-1 f-2 g f g f g |
    \repeat unfold 8 { e g } | \break
    f g e g d g e g f g e g f g d g |
    \repeat unfold 8 { e g } |
    f g e g d g e g f g e g f g d g | \break
    \clef bass
    r16 e, g c e4 r16 f, a c f4 |
    r16 d, f b d4 r16 e, g b e4 |
    \clef treble
    r16 c e a c4 r16 d, f a d4 | \break
    r16 b, d g b4 r16 c, e g c4 |
    r8 <a f> q q q q q q |
    \clef bass
    r <ef c fs,> q q q q q q | \break
    g,16 e'? c e \repeat unfold 3 { g,16 e' c e } |
    \repeat unfold 4 { g, f' b, f' } | \break
    <e c>4 r r <f d g,> |
    <e c> r r <f, d g,> |
    <e c> c' <c, c,> r |
  }
}

MONE_C_dynamics = {
  %% m42
  s1 \mf |
  s1*11 |
  %% m54
  s4 \cresc s4 s2 |
  s1 |
  %% m56
  s8 \f s8 s4 s2 |
  s1 |
  %% m58
  s16 \p s16 s8 s4 s2 |
  s1*8 |
  %% m67
  s2 \cresc s2 |
  s1 |
  %% m69
  s8 \f s8 s4 s2 |
  s1*4 |
}

MONE_C_pedal = {
}

\score {
  \new PianoStaff \with { instrumentName = \markup { \abs-fontsize #18 { "16" } } } <<
    \new Staff = "up" {
      \clef treble
      \MONE_global
      \repeat volta 2 {
        \MONE_A_upper
      }
      \repeat volta 2
      {
        \MONE_B_upper
        \MONE_C_upper
      }
    }
    \new Dynamics {
      \MONE_global
      \MONE_A_dynamics
      \MONE_B_dynamics
      \MONE_C_dynamics
    }
    \new Staff = "down" {
      \clef bass
      \MONE_global
      \MONE_A_lower
      \MONE_B_lower
      \MONE_C_lower
    }
    \new Dynamics {
      \MONE_global
      \MONE_A_pedal
      \MONE_B_pedal
      \MONE_C_pedal
    }
  >>
}
