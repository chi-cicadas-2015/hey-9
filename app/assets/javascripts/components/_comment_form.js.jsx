var CommentForm = React.createClass({
  handleSubmit: function ( event ) {
    event.preventDefault();

    var content = this.refs.content.getDOMNode().value.trim();

    // validate
    if (!content) {
      return false;
    }

    // submit
    var formData = $( this.refs.comment_form.getDOMNode() ).serialize();
    this.props.onMessageSubmit( formData, this.props.comment_form.action );

    // reset form
    this.refs.content.getDOMNode().value = "";
  },
  render: function () {
    return (
      <form ref="form" className="comment-form" action={ this.props.comment_form.action }  method="post" onSubmit={ this.handleSubmit }>
        <p><input type="hidden" name={ this.props.comment_form.csrf_param } value={ this.props.comment_form.csrf_token } /></p>
        <p><textarea ref="content" name="comment[content]" placeholder="Comments here..." /></p>
        <p><button type="submit">Post comments</button></p>
      </form>
    )
  }
});
