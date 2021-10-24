\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

sgr = #(define-music-function (note) (ly:music?) #{ \slashedGrace #note #})

\header {
  title = "Sonatina in G major"
  subsubtitle = \markup { "From" \italic "Zwei leichte Sonaten für das Pianoforte" "(1828)" }
  composer = "Ludwig van Beethoven (probably spurious)"
  opus = "Anh. 5, No. 1 (ca. 1790)"
  tagline = ##f
}

dolce = \markup { \italic "dolce" }

%% Both movements of this sonatina entirely repeat their A sections
%% in the score with no significant differences. For example, the first
%% movement has ABABAC form and is scored as
%%
%%   A |: B A :| C
%%
%% using a simple repeat and entirely duplicating the A section.
%%
%% It seems more natural to me to use alternative endings, i.e.
%%
%%   |: A  [1-2. B :| [3. C ||
%%
%% However, my assumption is that the simpler structure is used
%% simplify the reading for students who would typically be studying
%% this piece. So I am going to stick with the simple repeats.

MONE_A_RH = {
  % g2
  \sgr b8 a\( g a b\) |
  g4 g'8\(\> d\) d\( b\) b\( g\)\! |
  c2 \sgr c8 b\( a b c\) |
  a4 d8\( e d b c a\) |
  g2 \sgr b8 a\( g a b\) |
  c2 \sgr fs8 e\( d e fs\) |
  g\( d\) e\( c\) b\( d\) c\( a\) |
  a2\( g4\) r |
}

MONE_A_LH = {
  <b g>2 <c fs,> |
  <b g>4 r r2 |
  <a d,> <g d> |
  <fs d>4 r r2 |
  g8 d' b d g, f' d f |
  g,\( e' c e\) g,\( c a c\) |
  b4 c d d, |
  g d g, r |
}

\score { % Movement 1 ABABAC
  \new PianoStaff <<
    \new Staff = "upper" {
      \clef treble
      \key g \major
      \time 4/4
      \relative c'' {
        \tempo Moderato
        %% A
        g2\p \MONE_A_RH

        \repeat volta 2 {
          %% B
          a2\mf c8 b a b |
          d c a' g fs e d c |
          b2 d8 c b c |
          e d b' a g fs e d |
          c4 a'8 g fs e d c |
          b4 g'8 fs e d c b |
          a4 d,8 e fs g a b |
          c4 b8\( c d c a b\) |
          %% A Section again
          g2_\dolce \MONE_A_RH
        }

        %% C
        d'2\mf d4 d |
        d2\( g4 b\) |
        d2 d4 d |
        b2 r |
        d,2 d4 d |
        d2\( g4 b\) |
        d r fs, r |
        g r <g, b,> <g b,> |
        <g b,>2 <g b,> |
        <g b,>1\fermata

        \bar "|."
      }
    }

    \new Staff = "lower" {
      \clef bass
      \key g \major
      \time 4/4
      \relative c' {
        %% A
        \MONE_A_LH

        %% B
        fs'8 d fs d g d g d |
        a'4 r r2 |
        g8 d g d a' d, a' d, |
        b'4 r r2 |
        <a d,>4 r r <fs d> |
        <g d> r r <e d> |
        <fs d> r r2 |
        R1 |

        %% A
        \MONE_A_LH

        %% C
        d'8\( a' c a\) d,\( a' c a\) |
        d, g b g d g b g |
        d fs a fs d fs a fs |
        d g b g d g b g |
        d a' c a d, a' c a |
        d, g b g d g b g |
        d fs a fs d a' c a |
        <b g>4 r g, g |
        g g' d b |
        g1\fermata
      }
    }
  >>
}

\pageBreak

MTWO_A_RH = {
  b8\( c d\) |
  g,4 8 \sgr b a g a |
  b4 g8 b c d |
  g,4 8 \sgr a g fs g |
  a4 r8 b c d |
  g,4 8 g a b |
  c4\( e8 g e c\) |
  b4 d8 c a d |
  g,4 r8
}

MTWO_A_LH = {
  % r4 r8 |
  g8 <b d> q fs <c' d> q |
  g <b d> q r4 r8 |
  << % Brief two voice
    {
      r8 <b g> q r <cs g> q |
      r <d fs,> q
    } \\ {
      e,4. e4. |
      d4.
    }
  >>
  r4 r8 |
  g b d g, d' f |
  <e c>4 r8 r4 r8 |
  d, g b d, fs c' |
  <b g>4 r8
}

\score { % Movement 2 AABABAC
  \header {
    piece = "Romanze."
    opus = ##f
  }
  \new PianoStaff <<
    \new Staff = "upper" {
      \clef treble
      \key g \major
      \time 6/8
      \relative c'' {
        \partial 4.
        \repeat volta 2 {
          %% A
          \MTWO_A_RH
        }

        \repeat volta 2 {
          %% B
          \sgr a g fs g |
          a\(\<-. b-. cs-. d-. e-. f\)\!-.
          a4 g8 fs e d |
          cs b a e' cs g |
          fs4 a8 d d d |
          b4 g8 d' d d |
          b4 g8 d' d d |
          b g e fs g e |
          d4 r8 fs e d |
          a'4 r8 a g fs |
          c'4 r8 c b a |
          e'4\fermata\> d8\! c b a |
          g fs e d e fs |
          g a as

          %% A
          \MTWO_A_RH
        }

        %% C
        b8\p c d |
        a4 a8 \grace { a16\( b\) } c8. b16 a8 |
        g4 g8 \sgr a g fs g |
        e fs g a b a |
        a4 d,8 b' c d |
        a4 a8 \grace { a16\( b\) } c8 b a |
        g4. g'4 e8 |
        d4 b8 a4 d8 |
        b4. g'4 e8 |
        d4 b8 c a d |
        g,4 r8 <b g'>4 r8 |
        <g b,>4 r8
      }

      \bar "|."
    }

    \new Staff = "lower" {
      \clef bass
      \key g \major
      \time 6/8
      <<
        \relative c' {
          %% A
          r4 r8
          \MTWO_A_LH

          %% B
          r4 r8 |
          <a fs>2. |
          <b e,> |
          <cs a> |
          <d d,>4 r8 d, e fs |
          g a b d, e fs |
          g a b d, e fs |
          g4 r8 a4 r8 |
          d,4 r8 r4 r8 |
          <d fs a c>4\arpeggio r8 r4 r8 |
          <d fs a c>4\arpeggio r8 r4 r8 |
          <d fs a c>4\arpeggio\fermata r8 r4 r8 |
          R2. |
          R2. |

          %% A
          % r4 r8 collapsed into prior R2.
          \MTWO_A_LH

          %% C
          r4 r8
          <c^\=1( fs,^\=2( d_\=3(>2. |  % slurring individual notes in a chord
          \noBreak
          <b\=1) g\=2) e\=3)>4 r8 r4 r8 |
          c,4. <cs_\=1( g'^\=2(> |
          \noBreak
          <d\=1) fs\=2)>4 r8 r4 r8 |
          d fs c' d, fs c' |
          e, g b c, e g |
          d g b d, fs c' |
          g b d c, e g |
          d g b d, fs c' |
          <b g>4 r8 <d g,>4 r8 |
          <d, g,>4 r8
        }
      >>
    }
  >>
}
