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
  subsubtitle = \markup { "No. 3 from" \italic "Suite bergamasque" "(1905)" }
  composer = "Claude Debussy"
  opus = "L. 75, No. 3 (1890–1905)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \consists "Span_stem_engraver"
    \accidentalStyle piano
    \override TupletBracket.bracket-visibility = ##f
    printKeyCancellation = ##f
    \mergeDifferentlyDottedOn
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
  <af df,>8_\(
  \change Staff = "up"
  <af' f>
  \change Staff = "down"
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. 15-26 "Tempo rubato"

upper.B_soprano = \relative {
  \oneVoice

  \once \override TupletBracket.bracket-visibility = ##t
  \tuplet 2/3 {
    r8 <f'' bf f'>8^-~\(
  }
  q8 <ef bf' ef>^- q^-
  q^- <df bf' df>^- q^- |
  q^- <c gf' bf c>^- q^-
  \tuplet 2/3 {
    q^- <df bf' df>^-
  }
  <bf gf' bf>4.^-\) |

  \once \override TupletBracket.bracket-visibility = ##t
  \tuplet 2/3 {
    r8 <f' bf f'>8^-~\(
  }
  q <gf bf gf'> <f bf f'>
  <ef bf' ef> <f bf f'> <ef bf' ef> |
  <df bf' df> <ef bf' ef> <df bf' df>
  \tuplet 2/3 {
    <c bf' c>
    \slashedGrace ef'
    %-\vshape #'(((0 . 0) (0 . 0) (0 . 0) (0 . 0)))
    (
    <df bf) df,>
  }
  <bf, gf' bf>4.~\) |
  \tuplet 6/9 {
    q8[\( <gf gf'> <af ef' af> <c c'> <bf gf' bf> <gf gf'>]\)
  } |
  r8 <gf c ef gf>^-\( q^- q^- q^- <af c ef af>^- <gf c ef gf>4.^-\) |

  \voiceOne
  \tuplet 6/9 {
    r8 <gf gf'>[\( <af af'> <df df'> <bf bf'> <gf gf'>]\)
  } |
  \oneVoice
  r8 <gf bf ef gf>^-\( q^- q^- q^- <af c f af>^- <gf bf ef gf>4.^-\) |
  \voiceOne
  \tuplet 6/9 {
    r8 <gf gf'>[\( <af af'> <ef' ef'> <df df'> <bf bf'>]\)
  } |
  \oneVoice
  r8 <bf gf' bf>\( q q q <c af' c> <bf gf' bf> <df bf' df> <ef bf' ef>\) |

  \ottava #1
  <af df af'>2.^-\arpeggio q4.^-\arpeggio |
  q2.^-\arpeggio
  \ottava #0
  <af, ef' af>4.^-\arpeggio |
}

upper.B_alto = \relative {
  s1*9/8*6 |
  \barNumberCheck #21
  \once \omit TupletNumber
  \tuplet 6/9 {
    s8 df''4 s8 gf4
  } |
  s1*9/8 |
  \once \omit TupletNumber
  \tuplet 6/9 {
    s8 <df bf>4 s8 <bf' gf>4
  } |
  s1*9/8*3 |
}

upper.B = {
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.B_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.B_alto
    }
  >>
}

lower.B_tenor = \relative {
  \once \override TupletBracket.bracket-visibility = ##t
  \tuplet 2/3 {
    r8
    \clef treble
    \override TieColumn.tie-configuration = #'((0 . 1) (-1 . 1) (-4 . -1))
    <bf' gf f>_-~_\(
  }
  q8
  \revert TieColumn.tie-configuration
  <bf gf ef>_- q_-
  q_- <bf gf df>_- q_-
  q_- <bf gf c,>_- q_-
  \tuplet 2/3 {
    q_- <bf gf df>_-
  }
  <gf df bf>4._-\) |
  \clef bass
  \tuplet 2/3 {
    s8
    \clef treble
    \override TieColumn.tie-configuration = #'((0 . 1) (-1 . 1) (-4 . -1))
    <bf gf f>_-~_\(
  }
  q8
  \revert TieColumn.tie-configuration
  <ef bf gf> <bf gf f>
  <bf gf ef> <bf gf f> <bf gf ef> |
  <bf gf df> <bf gf ef> <bf gf df>
  \tuplet 2/3 { <bf gf c,> <bf gf df> }
  <gf ef bf>4.\) |
  \clef bass
  <<
    \relative {
      \voiceOne
      \stemDown
      \tupletDown
      \tweak TupletNumber.Y-offset #-2.5
      \tuplet 6/9 {
        r8 gf[_\( af c bf gf]\)
      } |
      r8 <gf c ef>^\( q
      q q <af c ef> <gf c ef>4.\) |
      \tweak TupletNumber.Y-offset #-2.5
      \tuplet 6/9 {
        r8 gf[_\( af df bf gf]\)
      } |
      r8 <gf bf ef>^-\( q^-
      q^- q^- <af c f>^-
      <gf bf ef>4.^-\) |
      \tweak TupletNumber.Y-offset #-2
      \tuplet 6/9 {
        r8 gf[_\( af ef' df bf]\)
      } |
      r8 <bf df gf>_\( q q q <c ef af> <bf df gf>
      \clef treble
      <df gf bf> <ef gf bf>\) |
    } \\
    \relative {
      \voiceThree
      \once \omit TupletNumber
      \tuplet 6/9 {
        s8 s8 <c' ef>4 <ef gf>4
      } |
      s1*9/8 |
      \once \omit TupletNumber
      \tuplet 6/9 {
        s8 <bf df>4 s8 <gf' df>4
      } |
      s1*9/8 |
      \once \omit TupletNumber
      \tuplet 6/9 {
        s8 <df bf>4 s8 <bf' gf>4
      } |
    }
  >>

  \oneVoice
  <f af df f>2.\arpeggio^-\( <ff af bf df ff>4.\arpeggio^- |
  \once \stemDown
  <ef gf af df ef>2.\arpeggio^-\) <af, ef' gf c>4.\arpeggio |
  \clef bass
}

lower.B_bass = \relative {
  <ef, ef,>2. s4. |
  s1*9/8 |
  <<
    \absolute {
      \voiceTwo
      <ef, ef,,>2.
    } \\
    \absolute {
      \voiceThree
      bf,2.^\markup { \small \italic "m.d." }
    }
  >>
  s4. |
  s1*9/8 |
  <af af,>2. s4. |
  <a a,>2. s4. |
  <bf bf,>2. s4. |
  <c c,>2. s4. |
  <df df,>2. s4. |
  <ef ef,>2. s4. |
  s1*9/8 * 2 |
  \barNumberCheck #27
}

lower.B = {
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.B_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.B_bass
    }
  >>
}

editorial.above.B = {
  \tempo "Tempo rubato"
  s1*9/8*4 |
  s8 s8-
  \markup {
    \override #'(line-width . 45)
    \fill-line { peu à peu cresc. et animé }
  }
  s8 s2. |
  s1*9/8*7 |
  \barNumberCheck #27
}

editorial.between.B = {
  s8\pp
  s1*8/8 |
  s1*9/8*9 |
  s8-
  \markup {
    \override #'(line-width . 20)
    \fill-line { dim. molto }
  } s4 s2. |
  s1*9/8*1 |
  \barNumberCheck #27
}

editorial.below.B = {
  s1*9/8*12 |
  \barNumberCheck #27
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C = mm. 27-36  "Un poco mosso"

upper.C_soprano = \relative {
  <af' f>2.\( cf4 df8\) |
  <af f>2.\( <cf af>4 af8\) |
  \oneVoice
  <df f,>4\( <ef af,>8 <f df>4. <df f,>4 <f df>8\)
  <g ef>\( <f df> <df bf>
  \voiceOne
  <df bf>4.\) r4 r8 |
  bf2.\( c4 f8\) |
  bf,2.\( c4 f8\) |
  gf4.~\(
  \tuplet 4/6 {
    8[ f d ef]
  } |
  bf'2. af4.\)
  <af f>2.\( <cf af>4 df8\) |
  <af f>2.\( <b gs>4 gs8\) |
}

upper.C_alto = \relative {
  s2. af'4. |
  s1*9/8*2 |
  s1*3/8
  \change Staff = "down"
  \once \stemUp
  g8
  -\shape #'((1 . 1.5) (-1 . 6) (0 . -1) (0 . 0))
  \(
  \change Staff = "up"
  f df
  df8. bf\) |

  s2. s4 af'16 f |
  s2. s4 af16 f |
  s4. gf'16 gf, bf f' gf, bf d gf, bf ef gf, bf |
  s1*9/8*3 |
}

upper.C = {
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.C_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.C_alto
    }
  >>
}

up = {
  \change Staff = "up"
  \stemDown
}
dn = {
  \change Staff = "down"
  \voiceOne
}

lower.C_tenor = \relative {
  %% Not sure why lilypond gets confused here, but it places the two
  %% staves too close together in this particular system and then
  %% complains about the beam slope on the staff-crossing figuration.
  %% We can fix it by just adding a little space between the staves.
  %% It doesn't happen every time because often there are other
  %% objects between the staff like hairpins that it has to work to
  %% avoid, introducing more space naturally.
  \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (11)))
  df,16_\( af' df f \up af df\) \dn
  f,,_\( c' f \up af c f\) \dn
  af,,_\( ff' af \up cf ff af\) \dn
  df,,,_\( af' df f \up af df\) \dn
  f,,_\( c' f \up af c f\) \dn
  af,,_\( ff' af \up cf af' ff\) \dn
  s1*9/8*2
  af,,16_\( ef' gf bf \up c gf'\) \dn
  gf,,_\( df' gf bf \up df gf\) \dn
  f,,_\( c' f af c8\) |
  af,16_\( ef' gf bf \up c gf'\) \dn
  gf,,_\( df' gf bf \up df gf\) \dn
  f,,_\( c' f af c8\) |
  ef,,16_\( bf' ef gf bf ef\) s1*6/8 |
  d16_\( gf bf \up bf gf' bf\) \dn
  ef,,_\( gf bf \up bf gf' bf\) \dn
  c,,
  _\shape #'((1 . 0.5) (0 . 0) (0 . 0) (0 . 0)) \(
  e af \up c e af\) \dn |
  \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (12)))
  df,,,
  _\shape #'((0 . 0) (0 . 0) (0 . -2) (0 . 0)) \(
  af' df f \up af df\) \dn
  af,
  _\shape #'((1 . 0.5) (0 . 0) (0 . -2) (0 . 0)) \(
  c f \up af c f\) \dn
  cf,
  _\shape #'((1 . 0.5) (0.5 . 0) (0.5 . -3) (0 . 0)) \(
  ff a \up cf ff a\) \dn |
  df,,,
  _\shape #'((0 . 0) (0 . 0) (0 . -2) (0 . 0)) \(
  af' df f \up af df\) \dn
  af,
  _\shape #'((1 . 0.5) (0 . 0) (0 . -2) (0 . 0)) \(
  c f \up af c f\) \dn
  b,,
  _\shape #'((1 . 0.5) (0 . 0) (0.5 . -2) (0 . 0)) \(
  e gs \up b gs'! e\) \dn |
}

lower.C_bass = \relative {
  df,4. f af |
  df, f af |
  df,16^\( af' df f af df f af f df af f af f df af df af\) |
  ef_\( bf' ef g bf ef g ef bf g ef df ef, bf' ef g ef bf\) |
  af4. gf f |
  af gf f |
  ef4.
  \tuplet 4/6 {
    gf''8[^\( f d ef]\)
  } |
  \clef treble
  d4. ef af, |
  \clef bass
  df,4. f af |
  df, f gs |
}

lower.C = {
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.C_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.C_bass
    }
  >>
}

editorial.above.C = {
  \tempo "Un poco mosso"
  s1*9/8*10 |
  \barNumberCheck #37
}

editorial.between.C = {
  s8\pp
  s1*8/8 |
  s1*9/8*1 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4\< s8 s4. s4 s8\! |
  s1*9/8*1 |
  s2.\p
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4\< s16\! s |
  s2.\p
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s4\< s16\! s |
  s1*9/8*2 |
  s16
  \tweak TextScript.extra-offset  #'(5 . 20)
  s
  - \tweak extra-offset  #'(0 . 2.5) - "cresc."
  s4 s2. |
  s1*9/8 |
  \barNumberCheck #37
}

editorial.below.C = {
  s1*9/8*10 |
  \barNumberCheck #37
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D = mm. 37-42 "En animant"

upper.D_soprano = \relative {
  cs'''4( gs8) e'4( cs8) gs'4( e8) |
  gs4.( fs2.) |
  fs2.\( a4 cs8\) |
  fs,,2.\( a4 cs8\) |
  \oneVoice
  <e cs>8\( <ds b> <cs a>
  \tuplet 2/3 { <b gs> <a fs>~ }
  q <gs e> <fs ds>\) |
  \voiceOne
  <e cs>\( <ds b> <cs a> <b gs> <a fs> <gs e>~ q <fs ds> <e cs>\) |
}

upper.D_alto = \relative {
  cs'''8. cs,16 gs' e
  e'8. e,16 cs' gs
  gs'8. gs,16 e' b |
  s1*9/8*4 |
  \resetRelativeOctave c'
  s2. a4. |
}

upper.D = {
  \barNumberCheck #37
  \key cs \minor
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.D_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.D_alto
    }
  >>
  \barNumberCheck #43
}

lower.D_tenor = \relative {
  cs'16\( e gs b8.\)
  e,16\( gs b cs8.\)
  gs16\( b cs e8.\) |
  gs,16_\( a cs \up gs' cs a\) \dn
  fs,_\( a cs \up fs cs' a\) \dn
  %% Maybe? placement of sharp is a bit confusing
  %\once \override NoteColumn.force-hshift = 1.5
  fs,
  -\shape #'((0 . -1) (1 . 0) (0 . 0) (0 . 0)) _\(
  a cs \up fs cs' a\) \dn |
  fs,_\( a cs \up fs cs' a\) \dn
  fs,_\( a cs \up fs cs' a\) \dn
  e,_\( a cs e \up cs'' cs,\) \dn |
  \resetRelativeOctave c'
  b_\( ds fs \up fs cs' a\) \dn
  a,_\( cs e \up fs cs' a\) \dn
  gs,_\( cs e a \up e' a\) \dn
  \once \mergeDifferentlyHeadedOn
  fs,,^\( cs' e fs a cs e fs e cs a fs\) e\( fs e cs a fs\) |
}

lower.D_bass = \relative {
  \clef treble
  b4. cs e |
  gs fs
  es |
  e ds cs |
  b a gs |
  fs2.~ 4. |
  \clef bass
  \oneVoice
  fs,16\( cs' e fs a cs e cs a fs e cs\)
  fs,\( cs' fs, cs' fs, cs'\) |
}

lower.D = {
  \barNumberCheck #37
  \key cs \minor
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.D_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.D_bass
    }
  >>
  \barNumberCheck #43
}

editorial.above.D = {
  \tempo "En animant"
  \barNumberCheck #37
  s1*9/8*6 |
  \barNumberCheck #43
}

editorial.between.D = {
  \barNumberCheck #37
  s8 s8-"più cresc." s1*7/8 |
  s1*9/8*3 |
  s8\f s1*8/8 |
  s8-"dim." s1*8/8 |
  \barNumberCheck #43
}

editorial.below.D = {
  \barNumberCheck #37
  s1*9/8*6 |
  \barNumberCheck #43
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% E = mm. 43-50 "Calmato"

upper.E_soprano = \relative {
  \barNumberCheck #43
  s1*9/8*8 |
  \barNumberCheck #51
}

upper.E_alto = \relative {
}

upper.E = {
  \key df \major
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.E_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.E_alto
    }
  >>
}

lower.E_tenor = \relative {
  \barNumberCheck #43
  s1*9/8*8 |
  \barNumberCheck #51
}

lower.E_bass = \relative {
}

lower.E = {
  \key df \major
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.E_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.E_bass
    }
  >>
}

editorial.above.E = {
  \tempo Calmato
  \barNumberCheck #43
  s1*9/8*8 |
  \barNumberCheck #51
}

editorial.between.E = {
  \barNumberCheck #43
  s1*9/8*8 |
  \barNumberCheck #51
}

editorial.below.E = {
  \barNumberCheck #43
  s1*9/8*8 |
  \barNumberCheck #51
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A′ = mm. 51-65 "a Tempo 1º"

upper.A′_soprano = \relative {
  \barNumberCheck #51
  s1*9/8*15 |
  \barNumberCheck #66
}

upper.A′_alto = \relative {
}

upper.A′ = {
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.A′_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.A′_alto
    }
  >>
}

lower.A′_tenor = \relative {
  \barNumberCheck #51
  s1*9/8*15 |
  \barNumberCheck #66
}

lower.A′_bass = \relative {
}

lower.A′ = {
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.A′_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.A′_bass
    }
  >>
}

editorial.above.A′ = {
  \tempo "a Tempo 1º"
  \barNumberCheck #51
  s1*9/8*15 |
  \barNumberCheck #66
}

editorial.between.A′ = {
  \barNumberCheck #51
  s1*9/8*15 |
  \barNumberCheck #66
}

editorial.below.A′ = {
  \barNumberCheck #51
  s1*9/8*15 |
  \barNumberCheck #66
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C′ = mm. 66-72 "morendo jusqu'à la fin"

upper.C′_soprano = \relative {
  \barNumberCheck #66
  s1*9/8*7 |
  \barNumberCheck #73
}

upper.C′_alto = \relative {
}

upper.C′ = {
  <<
    \context Voice = "soprano" {
      \voiceOne
      \upper.C′_soprano
    }
    \context Voice = "alto" {
      \voiceTwo
      \upper.C′_alto
    }
  >>
}

lower.C′_tenor = \relative {
  \barNumberCheck #66
  s1*9/8*7 |
  \barNumberCheck #73
}

lower.C′_bass = \relative {
}

lower.C′ = {
  <<
    \context Voice = "tenor" {
      \voiceOne
      \lower.C′_tenor
    }
    \context Voice = "bass" {
      \voiceTwo
      \lower.C′_bass
    }
  >>
}

editorial.above.C′ = {
  \barNumberCheck #66
  s16\pp
  s -\tweak extra-offset #'(1 . 1) -"morendo jusqu’à la fin"
  s1*8/8 |
  s1*9/8*6 |
  \barNumberCheck #73
}

editorial.between.C′ = {
  \barNumberCheck #66
  s1*9/8*7 |
  \barNumberCheck #73
}

editorial.below.C′ = {
  \barNumberCheck #66
  s1*9/8*7 |
  \barNumberCheck #73
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
      \editorial.above.B
      \editorial.above.C
      \editorial.above.D
      \editorial.above.E
      \editorial.above.A′
      \editorial.above.C′
    }
    \new Staff = "up" {
      \global
      \upper.A
      \upper.B
      \upper.C
      \bar "||"
      \upper.D
      \bar "||"
      \upper.E
      \upper.A′
      \upper.C′
      \bar "|."
    }
    \new Dynamics {
      \global
      \editorial.between.A
      \editorial.between.B
      \editorial.between.C
      \editorial.between.D
      \editorial.between.E
      \editorial.between.A′
      \editorial.between.C′
    }
    \new Staff = "down" {
      \global
      \lower.A
      \lower.B
      \lower.C
      \lower.D
      \lower.E
      \lower.A′
      \lower.C′
    }
    \new Dynamics {
      \global
      \editorial.below.A
      \editorial.below.B
      \editorial.below.C
      \editorial.below.D
      \editorial.below.E
      \editorial.below.A′
      \editorial.below.C′
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
