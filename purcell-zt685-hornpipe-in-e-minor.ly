\version "2.20.0"
\language "english"
\pointAndClickOff

\paper {
  indent = 0
  page-breaking = #ly:one-page-breaking
}

\layout {
  ragged-last = ##t
}

\header {
  title = "Hornpipe in E minor"
  composer = "Henry Purcell"
  opus = "ZT 685 (ca. 1690)"
  tagline = ##f
}

cresc = \markup { \italic "cresc." }
legato = \markup { \italic "legato" }
pocorit = \markup { \italic "poco rit." }

\new PianoStaff <<
  \new Staff = "upper" {
    \clef treble
    \key e \minor
    \tempo Allegretto
    \time 3/4
    \relative c'' {
      \partial 8
      e16\(^1\f fs |
      g8\)-. e8~-- 8 d16\(^4 c b c d8 |
      e\)-. e,~-- 8 fs16\( g a8^1 b16 c |
      b8\)-. e16\(^5 d c b a g^3 fs g a fs |
      g8\)-. e~-- 8 b'-. e-- 

      e16\(^1\mp fs |
      g8\)-. e8~-- 8 d16\(^4 c b c d8 |
      e\)-. e,~-- 8 fs16\(_\cresc g a8^1 b16 c |
      b8\)-. e16\(^5 d c b a g^3 fs g a fs |
      g8\)-.\mf e~-- 8[ b'-.] e--

      \break 
      \repeat volta 2 {
        g16\(^4\p fs |
        e8\)-. g~-- 8 fs16\( e d e^4 d c |
        b8\)-. d~--^3 8 16\(^2 e d c b^3 a\) |
        g16\(^1\< b d8\)-. b16\(^1 d g8\)-. d16\(^1 g b8\)-.\! |
        g-.^3 d~-- 8 g16\(^3 a b a g fs |
        e8\)-. g~-- 8 fs16\(^2 g a g fs e |
        ds8\)-.^2 fs~--^4 8 g16\(^5 fs e8\) d16\( c^1 |
        b8\)-. e16\(^5 d c b a g^3 fs\< g a fs\! |
      }

      \alternative {
        { % First ending
          g8\)-. e~-- 8[ b'-.]\< e--\!
        }
        { % Second ending \repeatTie?
        \break
          g,8-.\f e~--_\pocorit 8[ b'-.] e--\fermata
        }
      }

      \bar "|."
    }
  }

  \new Staff = "lower" {
    \clef bass
    \key e \minor
    <<
      \relative c {
        \stemUp
        r8_\legato |
        e2^1 d4^2 |
        c4.^1 b8^2 a4^1 |
        g^4 a b |
        e2^~ 8

        r |       
        e2^1 d4^2 |
        c4.^1 b8^2 a4^1 |
        g^4 a b |
        e2^~ 8

        r |
        e2^1 fs4^2 |
        g2 r4 |
        b, c^1 d^3 |
        g2^1 g4^\finger "1-2" |
        c2 a4^2 |
        b2 r4 |
        g,^5 a b |

        %% First ending
        e2^~ 8

        %% Second ending
        e2^~ 8\fermata
        
      }

      \new Voice {
        \voiceTwo
        \relative c, {
          s8 |
          r4 e r |
          r c8 r8 r4 |
          s2. |
          r4 b'_2 e,8--

          s |
          r4 e r |
          r c8 r8 r4 |
          s2. |
          r4 b'_2 e,8--

          s |
          r4 e r |
          r g a |
          s2. |
          r4 g r |
          r c r |
          r b c_3 |
          s2. |
          
          %% First ending
          r4 b e,8--

          %% Second ending
          r4 b' e,8--\fermata
        }
      }
    >>
  }
>>
  

