puts (1..40).inject(:*)/((a = (1..20).inject(:*))*a)
