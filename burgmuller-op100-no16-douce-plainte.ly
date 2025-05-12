\version "2.20.0"
\language "english"
\pointAndClickOff

\paper {
  indent = 0
  page-breaking = #ly:one-page-breaking
}

\header {
  title = "Douce Plainte"
  subsubtitle = \markup { "From " \italic "25 Études faciles et progressives" }
  composer = "Friedrich Burgmüller"
  opus = "Op. 100, No. 16 (1852)"
  tagline = ##f
}

cresc = \markup { \italic "cresc." }
dolente = \markup { \italic "dolente" }
depr = \markup { \italic "dimin. e poco riten." }

\new PianoStaff <<
  \new Staff = "upper" {
    \clef treble
    \key bf \major
    \tempo "Allegro moderato" 4 = 126
    \time 4/4
    \relative c'' {
      \repeat volta 2 { % A section
        d2\p_\dolente~^5 8\( c bf a\) |
        g2~ 8 d'\(\<[^2 g\> f\)\!] |
        ef2~ 8 8\(\> d c\)\! |
        d2~ 8 r r4 |
        a16\(^1 c a c d c d c a8\) r r4 |
        \stemUp
        g16\(_\cresc bf g bf d bf d bf g8\)
        \override Rest.staff-position = #4
        r r4 |
        \override Rest.staff-position = #8
        r
        \revert Rest.staff-position
        g'8\(\sf\>^5 e^3 cs^2 a^1 g^4 e\)\!^2 |
        \stemNeutral
      }
      \alternative {
        { % First ending
          d\(_\depr d' a d g, d' fs, d'\) |
        }
        { % Second ending
          \phrasingSlurDown
          d,\( d' fs,_2 d' a^1 d^3 cs^2 d\)^3 |
          \phrasingSlurNeutral
        }
      }
      \repeat volta 2 { % B section
        <ef c>-!\p\<^1^4 <d c>-!^1^3 <ef c>-! <d c>-! <ef c>-! <d c>-! <ef c>-! <d c>-!\! |
        \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
        d\(^2\> g f ef\! d-.\) d\(^1 ef e\) |
        <g ef?>-!^2^5\< <f ef>-!^2^4 <g ef>-! <f ef>-! <g ef>-! <f ef>-! <g ef>-! <f ef>-!\! |
        f\(\>^1 bf a g\! f-.\) bf\(\<^3 c d\)\! |
        d4.\f\( a8\) bf4.\( g8\)^1 |
        fs4.\(-2 a8\) g4.\( d8\) |
        f\(\>^4 ef d c\)\!^1 bf\(\p_3 g d' fs,\)_2 |
      }
      \alternative {
        { % First ending
          g16\(_1 bf d bf g-.\) r r8 r d'\(^3 cs d\) |
        }
        { % Second ending
          g,16\( bf d bf g-.\) r r8 r2 |
        }
      }
    }
    \bar "|."
  }

 \new Staff = "lower" {
    \clef bass
    \key bf \major
    \relative c' {
      %% A section
      g16\(^5 bf g bf d bf d bf g8\) r r4 |
      g16\( bf g bf d bf d bf g8\) r r4 |
      c16\( ef c ef g ef g ef c8\) r r4 |
      g16\( bf g bf d bf d bf g8\) d'\(\<[^1 ef\>^2 d\)\!]^1 |
      fs,2~^5 8  d'\(\<[^1 ef\>^2 d\)\!]^1 |
      \stemDown
      g,2~^5 8\( bf_4
      \change Staff = "upper"
      d_2 g\)_1 |
      bf\(\>_2 a\)\!_1
      \change Staff = "lower"
      \stemNeutral
      r4 r2 |
      %% First ending
      d,,4\(_5 c'_1 bf_3 a\)_4 |
      %% Second ending
      d, r r2 |

      %% B section
      \clef treble
      <a'' fs>8-!_1_3 \repeat unfold 7 { <a fs>-! } |
      <bf g>2_2_4~ 8 r r4 |
      <c a>8-!_1_3 \repeat unfold 7 { <c a>-! } |
      <d bf>2~^2^1 8 r r4 |
      \clef bass
      fs,,16\(^3 a^1 fs a fs8-.\) r g16\(^4 bf g bf g8-.\) r |
      a16\(^3 c^1 a c a8-.\) r bf16\(^4^\cresc d^1 bf d b^3 d b d\) |
      c4\(^2 d8^1 ef\)^2 d^1 r <c d,>4 |
      %% First ending
      <bf g> r16 cs\( d bf g8\) r r4 |
      %% Second ending
      <bf g> r16 cs\( d bf g8\) r r4 |
    }
  }
>>
