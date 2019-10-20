defmodule SimpleCipher do
  @alphabet Enum.to_list(?a..?z)
  @alphabet_length Enum.count(@alphabet)

  @doc """
  Given a `plaintext` and `key`, encode each character of the `plaintext` by
  shifting it by the corresponding letter in the alphabet shifted by the number
  of letters represented by the `key` character, repeating the `key` if it is
  shorter than the `plaintext`.

  For example, for the letter 'd', the alphabet is rotated to become:

  defghijklmnopqrstuvwxyzabc

  You would encode the `plaintext` by taking the current letter and mapping it
  to the letter in the same position in this rotated alphabet.

  abcdefghijklmnopqrstuvwxyz
  defghijklmnopqrstuvwxyzabc

  "a" becomes "d", "t" becomes "w", etc...

  Each letter in the `plaintext` will be encoded with the alphabet of the `key`
  character in the same position. If the `key` is shorter than the `plaintext`,
  repeat the `key`.

  Example:

  plaintext = "testing"
  key = "abc"

  The key should repeat to become the same length as the text, becoming
  "abcabca". If the key is longer than the text, only use as many letters of it
  as are necessary.
  """
  def encode(plaintext, key) do
    rotate(plaintext, key, &(&1 - hd(@alphabet) + &2 - hd(@alphabet)))
  end

  @doc """
  Given a `ciphertext` and `key`, decode each character of the `ciphertext` by
  finding the corresponding letter in the alphabet shifted by the number of
  letters represented by the `key` character, repeating the `key` if it is
  shorter than the `ciphertext`.

  The same rules for key length and shifted alphabets apply as in `encode/2`,
  but you will go the opposite way, so "d" becomes "a", "w" becomes "t",
  etc..., depending on how much you shift the alphabet.
  """
  def decode(ciphertext, key) do
    rotate(ciphertext, key, &(&1 - &2))
  end

  defp rotate(text, key, fun) do
    text
    |> String.to_charlist()
    |> Enum.zip(key |> String.to_charlist() |> Stream.cycle())
    |> Enum.map(fn
      {l, k} when l in @alphabet -> hd(@alphabet) + Integer.mod(fun.(l, k), @alphabet_length)
      {l, _} -> l
    end)
    |> List.to_string()
  end
end
