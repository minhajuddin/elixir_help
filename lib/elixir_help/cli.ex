defmodule ElixirHelp.Cli do

  # starts our server
  def start do
    ElixirHelp.Server.start
  end
end

defmodule ElixirHelp.InvalidDirectory do
  defexception message: "This is an invalid directory, it does not have a mix.exs"
end

defmodule ElixirHelp.Server do
  def start do
    assert_mix!
    :os.cmd(~s[nohup /bin/bash -c "elixir #{Path.expand("../run.exs", __FILE__)}"])
  end

  defp assert_mix! do
    if !File.exists?("mix.exs"), do: raise ElixirHelp.InvalidDirectory
  end
end
