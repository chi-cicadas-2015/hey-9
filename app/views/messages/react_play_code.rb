  <%= render partial: "message", collection: @messages %>
  <% if @current_user %>
    <%= render partial: "messages/form" %>
  <% end %>


# props and state
<script type="text/babel">

    var App = React.createClass({
      getDefaultProps: function() {
        return {
          text: "This is a default prop",
          cat: 0
        }
      },
      propTypes: {
        text: React.PropTypes.string,
        cat: React.PropTypes.number.isRequired
      },
      render: function() {
        var txt = this.props.text
        return (
            <div>
              <b>Property:</b>
              <h1>{txt}</h1>
            </div>
          );
      }
    });
    React.render(<App cat={5} />, document.body);

  </script>

# owner/ownee, slider, refs to access components
<script type="text/babel">

      var App = React.createClass({
        getInitialState: function() {
          return {
            red: 0,
            green: 0,
            blue: 0
          }
        },
        update: function() {
          this.setState({
            red: this.refs.red.refs.input.getDOMNode().value,
            green: this.refs.green.refs.input.getDOMNode().value,
            blue: this.refs.blue.refs.input.getDOMNode().value
          });
        },
        render: function() {
          return (
            <div>
              <Slider ref="red" update={this.update}  />
              <label>{this.state.red}</label>
              <Slider ref="green" update={this.update}  />
              <label>{this.state.green}</label>
              <Slider ref="blue" update={this.update}  />
              <label>{this.state.blue}</label>
            </div>
            );
        }
      });

      var Slider = React.createClass({
        render: function() {
          return (
            <div>
              <input ref="input" type="range" min="0" max="255" onChange={this.props.update} />
            </div>
            );
        }
      });

      React.render(<App cat={5} />, $("#leon_rules")[0]);

    </script>

    #children
     <script type="text/babel">

      var App = React.createClass({
        render:function() {
          return <Button><Heart />React</Button>
        }
      });

      var Button = React.createClass({
        render:function() {
          return <button>{this.props.children}</button>
        }
      });

      var Heart = React.createClass({
        render:function() {
          return <span ></span>
        }
      })

      React.render(<App />, $("#leon_rules")[0])

    </script>
