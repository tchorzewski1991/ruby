module Jaccard
  module Words
    # The Jaccard coefficient measures similarity between finite sample sets,
    # and is defined as the size of the intersection divided by the size of
    # the union of the sample sets. Algorithm itself is also known as the
    # Jaccard index or the Jaccard similarity coefficient. Algorithm refers
    # to a statistic used for comparing the similarity and diversity of
    # sample collections.
    #
    # Example: Basic usage
    #   Returns value of similarity between origin and target
    #
    #   Jaccard::Words.coefficient 'apple', 'applet'
    #   => 0.8
    #
    # Example: Basic usage
    #   Returns value of distance between origin and target
    #
    #   Jaccard::Words.distance 'apple', 'applet'
    #   => 0.2

    def self.coefficient(origin, target)
      # Variables origin_chars, and target_chars refer to temporary containers
      # for unique characters from both words. Iteration occures until both
      # strings will be reproduced in form of arrays. When iteration is
      # finished only thing to do is to produce intersection and union
      # basing on both of collections.

      o_codepoints = origin.codepoints
      t_codepoints = target.codepoints

      intersection = o_codepoints & t_codepoints
      union        = o_codepoints | t_codepoints

      intersection.length / Float(union.length).round(5)
    end

    def self.distance(origin, target)
      (1 - coefficient(origin, target)).round(5)
    end
  end
end
