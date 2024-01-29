\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
}

\header {
  title = "Clair de Lune"
  subsubtitle = \markup { "From" \italic "Suite bergamasque" "(1905)" }
  composer = "Claude Debussy"
  opus = "L. 75 (1890–1905)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \consists "Span_stem_engraver"
    \accidentalStyle piano
    %% \override TupletBracket.bracket-visibility = ##t
  }
}

global = {
  \key df \major
  \time 9/8
  \tempo "Andante très expressif"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 1-14 "Andante très expressif"

upper.A_soprano = \relative {
  s8
  \change Staff = "down"
  <af' f>
  -\shape #'(((0 . 0) (-0.5 . 2.5) (-2 . -2.5) (0 . 0))) \(
  \oneVoice
  \change Staff = "up"
  <af' f>~ q4.
  <f df>4.~\) |
  q8\( <ef c> <f df> <ef c>2.~\) |
  q8\( <df bf> <ef c>
  \voiceOne
  \tuplet 2/3 { df f~ }
  \tuplet 2/3 { 8 df~ } |
  <df bf> <c af> <df bf>
  <c af>2.\)~ |
  c8\( bf c bf ef bf af bf af~ |
  8 gf af gf4. f4.~\) |
  8\( f gf f bf f ef f ef~ |
  8 df ef df4. c4.\) |
  \oneVoice
  r4
  -\shape #'(((0 . -8) (0 . 1) (-1 . 1.5) (0 . 0))) \(
  r8 <af'' f>4. <f df>4.~\) |
  \voiceOne
  q8\( ef f ef2.\)~ |
  8\( <df df,> <ef ef,> <af df, af>4. <f df f,>4.\)~ |
  f8\( ef f ef4. df4.\)~ |
  8\( <df df,> <ef ef,> \tuplet 2/3 { <bf' bf,> <af af,>~ } \tuplet 2/3 { q <f f,>~ } |
  f8 ef f \tuplet 2/3 { ef df~ } \tuplet 2/3 { 8 bf\) } |
}

upper.A_alto = \relative {
  \oneVoice
  r8
  r8
  \voiceTwo
  s8
  s2. |
  s1*9/8*1 |
  s4.
  bf'2.~ |
  \once \hideNotes 8 s4 s2. |
  gf2. 4. |
  ef2. 4. |
  df2.~ 4. |
  bf2. af4. |
  s1*9/8 |
  r8 <bf' gf>4~ q2. |
  r8 af4 s2. |
  r8 <bf gf>4~ q2. |
  r8 af4 f'2. |
  r8 <bf, f>4~ 2. |
}

upper.A = {
  \clef treble
  <<
    \new Voice = "soprano" {
      \voiceOne
      \upper.A_soprano
    }
    \new Voice = "alto" {
      \voiceTwo
      \upper.A_alto
    }
  >>
}

lower.A_tenor = \relative {
  \oneVoice
  r8
  \once \hideNotes
  <af' f>4~
  q2. |
  <a gf>2.~ q4. |
  <af f>2.~ q4. |
  <gf ef>2.~ q4. |
  <ef df>2. <ef c>4. |
  <df bf>2. <c a>4. |

  \clef bass
  \voiceOne
  bf2.~ 4. |
  af2. gf4. |
  s2. s4. |
  r8 <df' bf gf df>4~ q2. |
  r8 <af f>4\( <f' df>4. <df af>\) |
  r8 <df bf gf df>4~ q2. |
  r8 <cf f,>4
  \override TieColumn.tie-configuration = #'((6 . 1) (8 . 0) (10 . 0))
  <f df cf>4.~
  q8
  \revert TieColumn.tie-configuration
  r r |
  r8
  <<
    {
      ef4~ \tuplet 2/3 { 8 df~ } 4.
    } \\ {
      <bf f>4~ q2.
    }
  >>
}

lower.A_bass = \relative {
  s1*9/8*6 |

  \barNumberCheck #7
  af2. gf4. |
  f2. \tuplet 2/3 { ef8 af,^~ } |
  \oneVoice
  \override Beam.auto-knee-gap = #1
  \override Beam.positions = #'(2.75 . 3.5)
  <af df,>8_\(
  \change Staff = "up"
  <af' f>
  \change Staff = "down"
  \revert Beam.auto-knee-gap
  \revert Beam.positions
  \clef treble
  <f' af>~ q2.\) |
  \clef bass
  \voiceTwo
  <df, gf,>2. s4. |
  <df f,>2. s4. |
  <df gf,>2. s4. |
  af2.~ 4. |
  bf2. s4. |
}

lower.A = {
  \clef treble
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.A_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.A_bass
    }
  >>
}

editorial.above.A = {
  s1*9/8*14 |
  \barNumberCheck #15
}

editorial.between.A = {
  s8\pp
  s8
  s16
  s16 ^"con sordina"
  s2. |
  s1*9/8*11 |
  \barNumberCheck #13
  s8
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s8\< s8 s8\!
  s1*5/8 |
  s8 s8 s8
  \tuplet 2/3 {
    s8 s8\> s8 s8\!
  } |
  \barNumberCheck #15
}

editorial.below.A = {
  s1*9/8*14 |
  \barNumberCheck #15
}

breaks_ref = {
  R1*9/8 * 3 | \break
  \barNumberCheck #4
  R1*9/8 * 4 | \break
  \barNumberCheck #8
  R1*9/8 * 4 | \break
  \barNumberCheck #12
  R1*9/8 * 3 | \break
  \barNumberCheck #15
  R1*9/8 * 3 | \pageBreak
  \barNumberCheck #18
  R1*9/8 * 3 | \break
  \barNumberCheck #21
  R1*9/8 * 3 | \break
  \barNumberCheck #24
  R1*9/8 * 3 | \break
  \barNumberCheck #27
  R1*9/8 * 2 | \break
  \barNumberCheck #29
  R1*9/8 * 2 | \pageBreak
  \barNumberCheck #31
  R1*9/8 * 2 | \break
  \barNumberCheck #33
  R1*9/8 * 2 | \break
  \barNumberCheck #35
  R1*9/8 * 2 | \break
  \barNumberCheck #37
  R1*9/8 * 2 | \break
  \barNumberCheck #39
  R1*9/8 * 2 | \pageBreak
  \barNumberCheck #41
  R1*9/8 * 2 | \break
  \barNumberCheck #43
  R1*9/8 * 2 | \break
  \barNumberCheck #45
  R1*9/8 * 2 | \break
  \barNumberCheck #47
  R1*9/8 * 2 | \break
  \barNumberCheck #49
  R1*9/8 * 2 | \pageBreak
  \barNumberCheck #51
  R1*9/8 * 2 | \break
  \barNumberCheck #53
  R1*9/8 * 2 | \break
  \barNumberCheck #55
  R1*9/8 * 2 | \break
  \barNumberCheck #57
  R1*9/8 * 2 | \break
  \barNumberCheck #59
  R1*9/8 * 3 | \pageBreak
  \barNumberCheck #62
  R1*9/8 * 3 | \break
  \barNumberCheck #65
  R1*9/8 * 2 | \break
  \barNumberCheck #67
  R1*9/8 * 2 | \break
  \barNumberCheck #69
  R1*9/8 * 2 | \break
  \barNumberCheck #71
}

%%showLastLength =   % use this to only render the last few measures
\score {
  \new PianoStaff <<
    \new Dynamics {
      \global
      \editorial.above.A
    }
    \new Staff = "up" {
      \global
      \upper.A
      \bar "|."
    }
    \new Dynamics {
      \global
      \editorial.between.A
    }
    \new Staff = "down" {
      \global
      \lower.A
    }
    \new Dynamics {
      \global
      \editorial.below.A
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
