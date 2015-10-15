var CommentList = React.createClass({
  render: function () {
    var commentNodes = this.props.comments.map(function(comment) {
        return <Comment commenter={ comment.commenter } content={ comment.content } commentable_id={ comment.commentable_id } />
    });

    return (
      <div className="comment-list">
        { commentNodes }
      </div>
    )
  }
});
