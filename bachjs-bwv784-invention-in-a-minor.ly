\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  % page-breaking = #ly:one-page-breaking
}

\header {
  title = "Invention in A minor"
  subsubtitle = \markup { "No. 13 from" \italic { "15 Inventions" } "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 784 (1723)"
  tagline = ##f
}

global = {
  \key a \minor
  \time 4/4
}

upperStaff = {
  \relative c' {
    r16 e a c b e, b' d c8[ e] gs, e' |
    a,16 e a c b e, b' d c8 a r4 |
    r16 e' c e a, c e, g f8[ a] d f~ |
    16 d b d g, b d, f e8 g c e~ |

    16 c a c f,8 d'~ 16 b g b e,8 c'~ |
    16 a f a d,8 b' c r r4 |
    r16 g c e d g, d' f e8[ g] b, g' |
    c,16 g c e d g, d' f e8[ c] g' e |

    c'16 a e a c, e a, c d8 fs a c |
    b16 g d g b, d g, b c8 e g b |
    a16 fs ds fs b, ds fs, a g8 g'~ 16 e c e |
    a,8 fs'~ 16 d b d g,8 e'~ 16 c a c |

    fs, g' fs e ds fs b, ds e8 r r4 |
    r16 g bf g e g cs, e g e cs e a, r r8 |
    r16 f' a f d f b, d f d b d g, r r8 |
    r16 e' g e c e a, c ds c a c fs, r r8 |

    r16 d' f d b d gs, b d b gs b e, r r8 |
    r16 e a c b e, b' d c8[ a] gs e |
    a16 c e c a c fs, a c a fs a ds, c' b a |
    gs b d b gs b d, f gs f d f b, f' e d |

    %% m. 21, Czerny/Peters ed. (ca. 1840) differs on beat 3
    %%               fs e c e
    %%
    %% The Bach holograph definitely has
    %%               ds c a c
    %%
    %% Bach was writing in soprano clef,so this could
    %% be a simple mistake of interpreting it as treble.
    %% It is hard to believe Czerny would have made this
    %% error though.
    %%
    %% Bach holograph (ca. 1720-23)
    %% Darnköhler (ca. 1745-55): agrees w/ holograph
    %% Grönland (ca. 1790): treble clef but agrees w/ holograph
    %% -- Scores above are handwritten, below are engraved
    %% Peters, ed. Czerny (ca. 1840): incorrect, see above
    %% Breitkept und Härtel, ed. Becker (1853): agrees w/ holograph
    %% Peters, ed. Czerny et al (ca. 1890): agrees w/ holograph
    %%
    %% Given that the later Peters edition (published after Czerny's
    %% death) corrects the error, it seems like we can chalk this one
    %% up to Czerny or possibly the engraver and bad proofreading.

    c e a e c e a, c ds c a c fs, c' b a |
    gs8[ b'] gs e r16 e a c b e, b' d |
    c a c e d b d f e c e g f e d c |
    b c d e f d gs d b' d, c a' f d b d |

    gs, b c a e a b gs a e c e a,4\fermata |
  }
  \bar "|."
}

lowerStaff = {
  \relative c {
    a8 a'4 gs8 a16 e a c b e, b' d |
    c8[ a] gs e a16 e a c b e, b' d |
    c8 a c a d16 a f a d, f a, c |
    b8[ d] g b~ 16 g e g c, e g, b |
    a8 c d16 f b, d g,8 b c16 e a, c |
    f,8 d g16 g' f g c, g' c e
    % Bach \clef alto
    d g, d' f |
    e8[ c] b g c16 g c e d g, d' f |
    e8 c r4 r16 g' e g c, e g, b |
    a8[ c] e g fs16 a d, fs a, d fs, a |
    g8[ b] d fs e16 g c, e g, c e, g |
    fs8[ a] b ds r16 e c e a, c e g |
    fs d b d g, b d fs e c a c fs, a c8~ |
    16 b c a
    % Bach \clef bass
    b8 b, e16 e' b g e b g b |
    e,8[ c'] g' bf cs, r r16 g'' f e |
    d8 d, f af b, r r16 f'' e d |
    c8 c, e fs a, r r16 e'' ds cs |
    b8 b, d f gs, r r16 d'' c b |
    c8[ a] gs e a16 e a c b e, b' d |
    c e a e c e a, c fs, a c a fs a ds, fs |
    e8 gs b gs e[ b] gs e |
    a c e c a[ c] ds, r |
    r16 b'' gs e d b' gs d c8[ e] gs, e' |
    a,[ fs'] b,[ gs'] c,[ a'] d, bf' |
    gs[ f] d[ b] gs[ a] d, e |
    f[ ds] e e' a,2\fermata |
  }
}

dynamics = {
}

pedalMarks = {
}

\score {
  \new PianoStaff <<
    \new Staff = "up" {
      \clef treble
      \global
      \upperStaff
    }
    \new Dynamics {
      \global
      \dynamics
    }
    \new Staff = "down" {
      \clef bass
      \global
      \lowerStaff
    }
    \new Dynamics {
      \global
      \pedalMarks
    }
  >>
}
