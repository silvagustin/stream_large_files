defmodule StreamLargeFiles do
  @moduledoc """
  Documentation for `StreamLargeFiles`.
  """

  @doc """
  Main function.

  ## Examples

      iex> StreamLargeFiles.main()
      Enum

  """

  def main do
    large_tiff_image_url =
      "https://www.spacetelescope.org/static/archives/images/original/heic0506a.tif"

    large_tiff_image_url
    |> HTTPStream.get()
    |> StreamGzip.gzip()
    |> Stream.into(File.stream!("image.tif.gz"))
    |> Stream.run()
  end
end
