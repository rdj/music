\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  indent = 0
  page-breaking = #ly:one-page-breaking
}

\layout {
}

\header {
  title = "Menuet"
  subsubtitle = \markup { "from" \italic "French Suite No. 6" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 817 (ca. 1725)"
  tagline = ##f
}

global = {
  \key e \major
  \time 3/4
}

upperStaff = {
  \relative c'' {
    \repeat volta 1 {
      gs8 fs e fs gs a |
      <<
        { b4( cs) b } \\
        { gs( a) gs }
      >> |
      ds8 e fs gs a ds |
      <<
        { e4( fs) e } \\
        { gs,( a) gs }
      >> |
      gs'8 fs e ds cs b | \break
      <<
        { fs'4( gs) fs } \\
        { as,( b) as }
      >> |
      b8([ as gs fs)] e'( ds) |
      <<
        { cs4( b2) } \\
        { e,4( ds2) }
      >> |
    }

    \repeat volta 1 {
      ds'8 cs b cs ds e |
      <<
        { fs4( gs) fs } \\
        { ds( e) ds }
      >> | \break
      a'8( gs fs e ds cs) |
      bs a'8( gs fs e ds) |
      e cs gs( a b cs) |
      d b cs a b ds,! | \break

      e fs gs a b cs |
      <<
        fs,2. \\
        ds
      >> |
      gs8 fs e fs gs a |
      <<
        { b4( cs) b } \\
        { gs( a) gs }
      >> |
      b,8 cs ds e fs gs | \break

      <<
        { a4( b) a } \\
        { fs( gs) fs }
      >> |
      gs8 b e( ds) gs( fs) |
      a gs fs e ds cs |
      <<
        { b e gs,4\trill fs8 e } \\
        { r4 e ds }
      >> |
      <<
        { e2. } \\
        { r8 b gs2 }
      >> |
    }
  }
}

lowerStaff = {
  \relative c {
    R2. |
    r8 e ds e e,4 |
    R2. |
    r8 e' ds e e,4 |
    R2. |
    r8 e' ds e e, e' |
    ds4 e fs |
    r8 b as b b,4 |

    R2. |
    r8 b' as b b,4 |
    R2. |
    r8 cs' bs cs cs,4 |
    R2. |
    r8 a' gs a a, a' |

    gs4 fs e |
    r8 b' a b b,4 |
    R2. |
    r8 b' a b b,4 |
    R2. |

    r8 b' a b b,4 |
    R2. |
    r8 b' a b b, a' |
    gs a b4 b, |
    e4. b8 e,4 |
  }
}

dynamics = {
}

pedalMarks = {
}

\score {
  \new PianoStaff <<
    \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible %% don't wrap fermata to next line
    \new Staff = "upper" {
      \clef treble
      \global
      \upperStaff
    }
    \new Dynamics {
      \global
      \dynamics
    }
    \new Staff = "lower"
    \with {
      \consists "Mark_engraver" % necessary to render the lower staff fermata
    }
    {
      \override Staff.RehearsalMark.direction = #DOWN
      \override Staff.RehearsalMark.rotation = #'(180 0 0)
      \clef bass
      \global
      \lowerStaff
      \mark \markup { \musicglyph "scripts.ufermata" } |
    }
    \new Dynamics {
      \global
      \pedalMarks
    }
  >>
}
