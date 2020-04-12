defmodule CookpadWeb.SessionView do
  use CookpadWeb, :view

  def form_input_class(field, errors) do
    case errors[field] do
      nil ->
        "form-control"

      _ ->
        "form-control is-invalid"
    end
  end
end
