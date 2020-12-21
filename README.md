## json-query

### Setup oh-my-zsh

```zsh
pushd $ZSH/custom/plugins && \
  git clone git@github.com:johnlayton/torbaystreet.git json-query && \
  popd || echo "I'm broken"
```

```zsh
plugins=(... recruitment)
```

### Setup other

```zsh
pushd $HOME && \
  git clone git@github.com:johnlayton/torbaystreet.git .json-query && \
  popd || echo "I'm broken"
```

```zsh
source ~/.json-query/json-query.plugin.zsh
```


### Usage

#### 
```zsh
> echo '[{"foo":1, "bar": "fizz"},{"foo":2, "bar": "buzz"}]' | jqx stream
{"foo":1,"bar":"fizz"}
{"foo":2,"bar":"buzz"}
```

#### 
```zsh
> echo '[{"foo":1, "bar": "fizz"},{"foo":2, "bar": "buzz"}]' | jqx stream | jqx fields foo
{
  "foo": 1
}
{
  "foo": 2
}
```

```zsh
> echo '[{"foo":1, "bar": "fizz"},{"foo":2, "bar": "buzz"}]' | jqx stream | jqx fields bar
{
"bar": "fizz"
}
{
"bar": "buzz"
}
```
