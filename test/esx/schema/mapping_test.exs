Code.require_file "../../../test_helper.exs", __ENV__.file

defmodule ESx.Model.MappingTest do
  use ExUnit.Case
  doctest ESx

  # import ESx.Test.Support.Checks

  alias ESx.Test.Support.Definition.{
    Schema, NoDSLSchema,
    # Model, NonameSchema
  }

  test "ok schema.mapping.__es_mapping__" do
    assert Schema.__es_mapping__(:to_map) == %{
      properties: %{
        content: %{
          analyzer: "ngram_analyzer",
          search_analyzer: "ngram_analyzer",
          type: "string"
        },
        title: %{
          analyzer: "ngram_analyzer",
          search_analyzer: "ngram_analyzer",
          type: "string"
        }
      },
      _all: %{enabled: false},
    }

    assert Schema.__es_mapping__(:as_json) == %{
      properties: %{
        content: %{
          analyzer: "ngram_analyzer",
          search_analyzer: "ngram_analyzer",
          type: "string"
        },
        title: %{
          analyzer: "ngram_analyzer",
          search_analyzer: "ngram_analyzer",
          type: "string"
        }
      },
      _all: %{enabled: false},
    }

    assert Schema.__es_mapping__(:types) == [
      title: [type: "string", analyzer: "ngram_analyzer", search_analyzer: "ngram_analyzer"],
      content: [type: "string", analyzer: "ngram_analyzer", search_analyzer: "ngram_analyzer"],
    ]

    assert Schema.__es_mapping__(:type, :title) == [
      type: "string", analyzer: "ngram_analyzer", search_analyzer: "ngram_analyzer"
    ]
    assert Schema.__es_mapping__(:type, :content) == [
      type: "string", analyzer: "ngram_analyzer", search_analyzer: "ngram_analyzer"
    ]
    assert nil == Schema.__es_mapping__(:type, :unkown)

    assert Schema.__es_mapping__(:settings) == [_all: [enabled: false]]
  end

  test "ok schema.mapping.__es_mapping__ with no DSL" do
    assert NoDSLSchema.__es_mapping__(:to_map) == %{
      properties: %{
        content: %{
          analyzer: "ngram_analyzer",
          search_analyzer: "ngram_analyzer",
          type: "string"
        },
        title: %{
          analyzer: "ngram_analyzer",
          search_analyzer: "ngram_analyzer",
          type: "string"
        }
      },
      _all: %{enabled: false},
    }

    assert NoDSLSchema.__es_mapping__(:as_json) == %{
      properties: %{
        content: %{
          analyzer: "ngram_analyzer",
          search_analyzer: "ngram_analyzer",
          type: "string"
        },
        title: %{
          analyzer: "ngram_analyzer",
          search_analyzer: "ngram_analyzer",
          type: "string"
        }
      },
      _all: %{enabled: false},
    }

    assert NoDSLSchema.__es_mapping__(:types) == [
      title: [type: "string", analyzer: "ngram_analyzer", search_analyzer: "ngram_analyzer"],
      content: [type: "string", analyzer: "ngram_analyzer", search_analyzer: "ngram_analyzer"],
    ]

    assert NoDSLSchema.__es_mapping__(:type, :title) == [
      type: "string", analyzer: "ngram_analyzer", search_analyzer: "ngram_analyzer"
    ]
    assert NoDSLSchema.__es_mapping__(:type, :content) == [
      type: "string", analyzer: "ngram_analyzer", search_analyzer: "ngram_analyzer"
    ]
    assert nil == NoDSLSchema.__es_mapping__(:type, :unkown)

    assert NoDSLSchema.__es_mapping__(:settings) == [_all: [enabled: false]]

  end

end
